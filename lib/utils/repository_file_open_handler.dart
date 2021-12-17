import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/network_markdown_reader_page.dart';
import 'package:flutter_gitee/main/base/ui/network_source_code_reader_page.dart';
import 'package:flutter_gitee/repo/model/repository_model.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

enum _FileType {
  raw,
  markdown,
  sourceCode,
  plainText,
  json,
}

class RepositoryFileOpenHandler {
  static final _handler = RepositoryFileOpenHandler._internal();
  static RepositoryFileOpenHandler getInstance() {
    return _handler;
  }

  RepositoryFileOpenHandler._internal();

  void open(
      BuildContext context, String fullName, String filename, String sha) {
    final lastIndex = filename.lastIndexOf(".");
    final suffix = lastIndex == filename.length - 1
        ? ""
        : filename.substring(lastIndex + 1);
    switch (parseFileType(suffix)) {
      case _FileType.raw:
        break;
      case _FileType.markdown:
        _openWithMarkdownReader(context, fullName, filename, sha);
        break;
      case _FileType.sourceCode:
        _openWithSourceCodeReader(context, fullName, filename, sha);
        break;
      case _FileType.plainText:
        _openWithPlainTextReader(context, fullName, filename, sha);
        break;
    }
  }

  void _openWithSourceCodeReader(
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
      return NetworkSourceCodeReaderPage(
          title: filename, loader: markdownFuture);
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
      return NetworkMarkdownReaderPage(title: filename, loader: markdownFuture);
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
      return NetworkMarkdownReaderPage(title: filename, loader: textFuture);
    }));
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
        return _FileType.sourceCode;
      case "":
        return _FileType.raw;
    }
    return _FileType.raw;
  }
}
