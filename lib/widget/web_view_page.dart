import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/main/base/widget/general_bottom_sheet_header.dart';
import 'package:flutter_gitee/widget/base_state.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

typedef TargetUrlProcessor = dynamic Function(String);

class WebViewPage extends StatefulWidget {
  final String url;
  final String? targetUrl;
  final TargetUrlProcessor? urlProcessor;
  const WebViewPage(
      {Key? key, required this.url, this.targetUrl, this.urlProcessor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends BaseState<WebViewPage> {
  var _titleText = "";
  InAppWebViewController? _webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  late PullToRefreshController _pullToRefreshController;

  @override
  void initState() {
    super.initState();
    _pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          _webViewController?.reload();
        } else if (Platform.isIOS) {
          _webViewController?.loadUrl(
              urlRequest: URLRequest(url: await _webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget create(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_webViewController == null) {
          return true;
        }
        final canGoBack = await _webViewController!.canGoBack();
        if (canGoBack) {
          _webViewController!.goBack();
        }
        return !canGoBack;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titleText),
          actions: [
            IconButton(
                onPressed: () {
                  _openOptionDialog(context, widget.url);
                },
                icon: const Icon(Icons.menu))
          ],
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStop: (controller, url) {
              _webViewController?.getTitle().then((value) {
                setState(() {
                  _titleText = value ?? "";
                });
              });
            },
            onLoadStart: (controller, url) {
              if (widget.targetUrl == url.toString() &&
                  widget.urlProcessor != null) {
                final result = widget.urlProcessor!(url.toString());
                Navigator.pop(context, result);
              }
            },
          ),
        ),
      ),
    );
  }

  void _openOptionDialog(BuildContext context, String url) {
    showModalBottomSheet(
        shape: bottomSheetShape,
        context: context,
        builder: (context) {
          return HeaderContentBottomSheet(
              title: S.of(context).options,
              body: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.open_in_browser),
                    title: Text(S.of(context).openInBrowser),
                    onTap: () {
                      Navigator.pop(context);
                      launch(url);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.copy),
                    title: Text(S.of(context).copy),
                    onTap: () {
                      Navigator.pop(context);
                      Clipboard.setData(ClipboardData(text: url));
                      Fluttertoast.showToast(msg: S.of(context).copied);
                    },
                  ),
                ],
              ));
        });
  }
}
