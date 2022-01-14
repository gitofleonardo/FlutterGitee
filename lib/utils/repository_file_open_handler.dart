import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/network_image_viewer_page.dart';
import 'package:flutter_gitee/main/base/ui/network_markdown_reader_page.dart';
import 'package:flutter_gitee/main/base/ui/network_plain_text_reader_page.dart';
import 'package:flutter_gitee/main/base/ui/network_source_code_reader_page.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/main/base/widget/vertical_text_icon_button.dart';
import 'package:flutter_gitee/repo/bean/repository_tree_entity.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum _FileType {
  raw,
  markdown,
  sourceCode,
  plainText,
  image,
}

class RepositoryBlob {
  late String path;
  late String mode;
  late String sha;
  late int size;
  late String url;

  RepositoryBlob.fromTree(RepositoryTreeTree tree) {
    path = tree.path!;
    mode = tree.mode!;
    sha = tree.sha!;
    size = tree.size!;
    url = tree.url!;
  }
}

class RepositoryFileOpenHandler {
  static final _handler = RepositoryFileOpenHandler._internal();
  static RepositoryFileOpenHandler getInstance() {
    return _handler;
  }

  RepositoryFileOpenHandler._internal();

  void open(BuildContext context, String fullName, RepositoryBlob blob) {
    final lastIndex = blob.path.lastIndexOf(".");
    final suffix = lastIndex == blob.path.length - 1
        ? ""
        : blob.path.substring(lastIndex + 1);
    switch (parseFileType(suffix)) {
      case _FileType.raw:
        _openRawFile(context, fullName, blob);
        break;
      case _FileType.markdown:
        _openWithMarkdownReader(context, fullName, blob.path, blob.sha);
        break;
      case _FileType.sourceCode:
        _openWithSourceCodeReader(
            context, fullName, blob.path, blob.sha, suffix);
        break;
      case _FileType.plainText:
        _openWithPlainTextReader(context, fullName, blob.path, blob.sha);
        break;
      case _FileType.image:
        _openWithImageViewer(context, fullName, blob);
        break;
    }
  }

  void _openWithImageViewer(
      BuildContext context, String fullName, RepositoryBlob blob) {
    Future<BaseResult<Uint8List>> imageFuture() async {
      final res = await getRepoBlobFile(fullName, blob.sha);
      final copyResult = BaseResult<Uint8List>();
      copyResult.resultCode = res.resultCode;
      copyResult.state = res.state;
      copyResult.errorMessage = res.errorMessage;
      copyResult.data = base64ToUint8ListImage(res.data?.content ?? "");
      return copyResult;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NetworkImageViewerPage(
        title: blob.path,
        loader: imageFuture,
      );
    }));
  }

  void _openRawFile(
      BuildContext context, String fullName, RepositoryBlob blob) {
    const delegate =
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4);
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: "Open",
              body: GridView(
                gridDelegate: delegate,
                children: [
                  VerticalTextIconButton(
                      onTap: () {
                        Navigator.pop(context);
                        _openWithPlainTextReader(
                            context, fullName, blob.path, blob.sha);
                      },
                      icon: const Icon(FontAwesomeIcons.file),
                      text: const Text("Text")),
                  VerticalTextIconButton(
                      onTap: () async {
                        Navigator.pop(context);
                        _openWithMarkdownReader(
                            context, fullName, blob.path, blob.sha);
                      },
                      icon: const Icon(FontAwesomeIcons.markdown),
                      text: const Text("Markdown")),
                  VerticalTextIconButton(
                      onTap: () {
                        _openWithImageViewer(context, fullName, blob);
                      },
                      icon: const Icon(FontAwesomeIcons.image),
                      text: const Text("Image")),
                ],
              ),
              contentScrollable: false);
        });
  }

  void _openWithSourceCodeReader(BuildContext context, String fullName,
      String filename, String sha, String suffix) {
    Future<BaseResult<String>> markdownFuture() async {
      final res = await getRepoBlobFile(fullName, sha);
      final copyResult = BaseResult<String>();
      copyResult.resultCode = res.resultCode;
      copyResult.state = res.state;
      copyResult.errorMessage = res.errorMessage;
      copyResult.data = base64ToString(res.data?.content);
      return copyResult;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NetworkSourceCodeReaderPage(
        title: filename,
        loader: markdownFuture,
        language: parseLanguage(suffix),
      );
    }));
  }

  void _openWithMarkdownReader(
      BuildContext context, String fullName, String filename, String sha) {
    Future<BaseResult<String>> markdownFuture() async {
      final res = await getRepoBlobFile(fullName, sha);
      final copyResult = BaseResult<String>();
      copyResult.resultCode = res.resultCode;
      copyResult.state = res.state;
      copyResult.errorMessage = res.errorMessage;
      copyResult.data = base64ToString(res.data?.content);
      return copyResult;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NetworkMarkdownReaderPage(
        title: filename,
        loader: markdownFuture,
        fullName: fullName,
      );
    }));
  }

  void _openWithPlainTextReader(
      BuildContext context, String fullName, String filename, String sha) {
    Future<BaseResult<String>> textFuture() async {
      final res = await getRepoBlobFile(fullName, sha);
      final copyResult = BaseResult<String>();
      copyResult.resultCode = res.resultCode;
      copyResult.state = res.state;
      copyResult.errorMessage = res.errorMessage;
      copyResult.data = base64ToString(res.data?.content);
      return copyResult;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NetworkPlainTextReaderPage(title: filename, loader: textFuture);
    }));
  }

  String parseLanguage(String suffix) {
    switch (suffix) {
      case "applescript":
      case "bat":
      case "c":
      case "dart":
      case "java":
      case "lua":
      case "groovy":
      case "json":
      case "php":
      case "rust":
      case "perl":
      case "swift":
      case "scala":
      case "r":
      case "xml":
      case "yaml":
      case "cs":
      case "cpp":
      case "fs":
      case "go":
      case "f":
      case "sql":
      case "css":
      case "es6":
      case "html":
      case "jl":
      case "jsp":
      case "lisp":
        return suffix;
      case "sh":
        return "bash";
      case "asp":
      case "aspx":
        return "cs";
      case "cc":
      case "h":
        return "c";
      case "clj":
        return "clojure";
      case "e":
      case "el":
      case "erl":
        return "erlang";
      case "hs":
        return "haskell";
      case "js":
        return "javascript";
      case "kt":
        return "kotlin";
      case "m":
      case "mm":
        return "objectivec";
      case "pas":
        return "delphi";
      case "pl":
        return "perl";
      case "py":
        return "python";
      case "rb":
        return "ruby";
      case "ts":
        return "typescript";
      case "v":
      case "vb":
      case "vba":
        return "vbnet";
      case "vbs":
        return "vbscript";
    }
    return suffix;
  }

  _FileType parseFileType(String suffix) {
    suffix = suffix.toLowerCase();
    switch (suffix) {
      case "md":
        return _FileType.markdown;
      case "txt":
        return _FileType.plainText;
      case "applescript":
      case "asp":
      case "aspx":
      case "bat":
      case "c":
      case "cc":
      case "clj":
      case "cpp":
      case "cs":
      case "dart":
      case "e":
      case "el":
      case "erl":
      case "es6":
      case "f":
      case "fs":
      case "go":
      case "groovy":
      case "hs":
      case "html":
      case "java":
      case "jl":
      case "js":
      case "json":
      case "jsp":
      case "kt":
      case "lisp":
      case "lua":
      case "m":
      case "mm":
      case "pas":
      case "perl":
      case "php":
      case "pl":
      case "pm":
      case "py":
      case "r":
      case "rb":
      case "rust":
      case "sh":
      case "scala":
      case "sql":
      case "swift":
      case "ts":
      case "v":
      case "vb":
      case "vba":
      case "vbs":
      case "xml":
      case "yaml":
      case "h":
        return _FileType.sourceCode;
      case "":
        return _FileType.raw;
      case "jpg":
      case "jpeg":
      case "png":
      case "bmp":
      case "gif":
      case "tiff":
      case "raw":
        return _FileType.image;
    }
    return _FileType.raw;
  }
}
