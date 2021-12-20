import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/widget/global_theme_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../request_base_result.dart';

typedef TextLoader = Future<BaseResult<String>> Function();

class NetworkPlainTextReaderPage extends StatefulWidget {
  final String title;
  final TextLoader loader;

  const NetworkPlainTextReaderPage(
      {Key? key, required this.title, required this.loader})
      : super(key: key);

  @override
  _NetworkPlainTextReaderPageState createState() =>
      _NetworkPlainTextReaderPageState();
}

class _NetworkPlainTextReaderPageState
    extends State<NetworkPlainTextReaderPage> {
  String _dat = "";

  @override
  Widget build(BuildContext context) {
    return GlobalThemeWidget(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title, maxLines: 1),
            actions: [
              IconButton(
                onPressed: () {
                  if (_dat.isNotEmpty) {
                    Clipboard.setData(ClipboardData(text: _dat));
                    Fluttertoast.showToast(msg: "Copied");
                  }
                },
                icon: const Icon(FontAwesomeIcons.clipboard),
                tooltip: "Copy All",
              )
            ],
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
                  _dat = res.data ?? "";
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ConstrainedBox(
                        child: SelectableText(_dat),
                        constraints:
                            const BoxConstraints(minWidth: double.infinity),
                      ),
                    ),
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
