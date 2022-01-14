import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../request_base_result.dart';

typedef SourceCodeLoader = Future<BaseResult<String>> Function();

class CodeRowData {
  String text = "";
  bool selected = false;

  CodeRowData(this.text, this.selected);
}

class NetworkSourceCodeReaderPage extends StatefulWidget {
  final String title;
  final String language;
  final SourceCodeLoader loader;

  const NetworkSourceCodeReaderPage(
      {Key? key,
      required this.title,
      required this.loader,
      required this.language})
      : super(key: key);

  @override
  _NetworkSourceCodeReaderPageState createState() =>
      _NetworkSourceCodeReaderPageState();
}

class _NetworkSourceCodeReaderPageState
    extends BaseState<NetworkSourceCodeReaderPage> {
  final _data = <CodeRowData>[];
  String _stringData = "";

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: _stringData));
              Fluttertoast.showToast(msg: "Copied");
            },
            icon: const Icon(FontAwesomeIcons.clipboard),
            tooltip: "Copy All",
          )
        ],
      ),
      body: FutureBuilder<BaseResult<String>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final res = snapshot.data;
              if (res == null || !res.success) {
                return TapToRetryWidget(
                    onTap: () {
                      setState(() {});
                    },
                    message: "Tap To Retry");
              }
              _stringData = res.data ?? "";
              _data.addAll((_stringData)
                  .split("\n")
                  .map((e) => CodeRowData(e, false)));
              final maxLen = "${_data.length}".length;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final line = index + 1;
                  final indexLen = "$line".length;
                  return Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.horizontal,
                      children: [
                        const SizedBox(width: 10),
                        Text("${'0' * (maxLen - indexLen)}$line"),
                        const SizedBox(width: 5),
                        Expanded(
                            child: Material(
                              child: InkWell(
                                onTap: () {},
                                onLongPress: () {
                                  Clipboard.setData(
                                      ClipboardData(text: _data[index].text));
                                  Fluttertoast.showToast(msg: "Copied");
                                },
                                child: HighlightView(
                                  _data[index].text,
                                  language: widget.language,
                                  theme: isDarkTheme ? darkTheme : githubTheme,
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 2),
                                ),
                              ),
                            ))
                      ]);
                },
                itemCount: _data.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: widget.loader()),
    );
  }
}
