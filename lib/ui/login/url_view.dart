import 'dart:async';
import 'dart:io';

import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class URLView extends StatefulWidget {
  final String url;
  final String title;

  URLView(this.url, this.title);

  @override
  URLViewState createState() => URLViewState(this.url, this.title);
}

class URLViewState extends State<URLView> {
  final String url;
  final String title;

  URLViewState(this.url, this.title);

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Completer<WebViewController> _wbController = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarHome(
          title: this.title,
          actionList: [
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Reload',
              onPressed: () {
                // _wbController.reload();
              },
            )
          ],
        ),
        body: Column(children: [
          Expanded(
              child: WebView(
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewController) {
              _wbController.complete(webviewController);
            },
          )),
        ]));
  }
}
