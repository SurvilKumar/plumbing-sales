// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sales/presentation/utils/constants.dart';

class WebviewPage extends StatefulWidget {
  String url;
  WebviewPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final GlobalKey webViewKey = GlobalKey();
  double progress = 0;

  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;
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

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.orange[800],
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController!.canGoBack()) {
          webViewController!.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.url),
              ),
              initialOptions: options,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              pullToRefreshController: pullToRefreshController,
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController.endRefreshing();
              },
              onLoadError: (controller, url, code, message) {
                pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                  // urlController.text = this.url;
                });
              },
            ),
            progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    color: ConstantsData.primaryorangcolor,
                    backgroundColor: ConstantsData.whitecolor.withOpacity(0.5),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
