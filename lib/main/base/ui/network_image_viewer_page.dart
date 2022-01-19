import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/ui/tap_to_retry_widget.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:photo_view/photo_view.dart';

import '../request_base_result.dart';

typedef ImageLoader = Future<BaseResult<Uint8List>> Function();

class NetworkImageViewerPage extends StatefulWidget {
  final ImageLoader loader;
  final String title;

  const NetworkImageViewerPage(
      {Key? key, required this.loader, required this.title})
      : super(key: key);

  @override
  _NetworkImageViewerPageState createState() => _NetworkImageViewerPageState();
}

class _NetworkImageViewerPageState extends BaseState<NetworkImageViewerPage> {
  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, maxLines: 1),
      ),
      body: FutureBuilder<BaseResult<Uint8List>>(
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
              final dat = res.data!;
              return PhotoView(imageProvider: MemoryImage(dat));
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
