import 'package:flutter/material.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

import '../request_base_result.dart';

typedef SourceCodeLoader = Future<BaseResult<String>> Function();

class NetworkSourceCodeReaderPage extends StatefulWidget {
  final String title;
  final SourceCodeLoader loader;

  const NetworkSourceCodeReaderPage(
      {Key? key, required this.title, required this.loader})
      : super(key: key);

  @override
  _NetworkSourceCodeReaderPageState createState() =>
      _NetworkSourceCodeReaderPageState();
}

class _NetworkSourceCodeReaderPageState
    extends State<NetworkSourceCodeReaderPage> {
  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
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
                  final dat = (res.data ?? "").split("\n");
                  final maxLen = "${dat.length}".length;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final line = index + 1;
                      final indexLen = "$line".length;
                      return Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.horizontal,
                          children: [
                            Text("${'0' * (maxLen - indexLen)}$line"),
                            const SizedBox(width: 5),
                            Expanded(
                                child: HighlightView(
                              dat[index],
                              language: "dart",
                              theme: githubTheme,
                            ))
                          ]);
                    },
                    itemCount: dat.length,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: widget.loader()),
        );
      }),
    );
  }
}
