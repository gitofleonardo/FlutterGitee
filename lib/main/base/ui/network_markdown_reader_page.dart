import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/request_base_result.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/utils/global_utils.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

typedef MarkdownLoader = Future<BaseResult<String>> Function();

class NetworkMarkdownReaderPage extends StatefulWidget {
  final MarkdownLoader loader;
  final String title;
  final String fullName;

  const NetworkMarkdownReaderPage(
      {Key? key,
      required this.title,
      required this.loader,
      required this.fullName})
      : super(key: key);

  @override
  _NetworkMarkdownReaderPageState createState() =>
      _NetworkMarkdownReaderPageState();
}

class _NetworkMarkdownReaderPageState
    extends BaseState<NetworkMarkdownReaderPage> {
  @override
  Widget create(BuildContext context) {
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
                    message: S.of(context).tapToRetry);
              }
              return Markdown(
                data: res.data ?? "",
                imageBuilder: (uri, title, alt) {
                  return repositoryMarkdownImageBuilder(
                      uri, widget.fullName, "$title", "$alt");
                },
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
