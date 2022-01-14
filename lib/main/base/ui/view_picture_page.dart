import 'package:flutter/material.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  final String url;
  const ViewPicturePage({Key? key, required this.url}) : super(key: key);

  @override
  _ViewPicturePageState createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends BaseState<ViewPicturePage> {
  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Picture"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Hero(
          tag: widget.url,
          child: PhotoView(imageProvider: NetworkImage(widget.url)),
        ),
      ),
    );
  }
}
