import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/widget/base_state.dart';
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
    extends BaseState<NetworkPlainTextReaderPage> {
  String _dat = "";

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, maxLines: 1),
        actions: [
          IconButton(
            onPressed: () {
              if (_dat.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: _dat));
                Fluttertoast.showToast(msg: S.of(context).copied);
              }
            },
            icon: const Icon(FontAwesomeIcons.clipboard),
            tooltip: S.of(context).copyAll,
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
                    message: S.of(context).tapToRetry);
              }
              _dat = res.data ?? "";
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
  }
}
