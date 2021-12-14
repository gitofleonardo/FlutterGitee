import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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

class _WebViewState extends State<WebViewPage> {
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
  Widget build(BuildContext context) {
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
              debugPrint("OnPageLoad:$url");
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
}
