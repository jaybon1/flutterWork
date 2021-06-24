import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_test/cross_import/social_login/social_login_controller.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController;
    final Completer<WebViewController> _completer =
        Completer<WebViewController>();

    final _socialLoginController = Get.find<SocialLoginController>();
    _socialLoginController.setUri();

    return Scaffold(
      appBar: AppBar(
        title: Text("소셜 로그인"),
      ),
      body: WebView(
            onWebViewCreated: (controller) {
              _completer.complete(controller);
              webViewController = controller;
            },
            initialUrl: _socialLoginController.rxUri.value.toString(),
            userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36",
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: Set.from([
              JavascriptChannel(
                name: "checkSocialCodeDTO",
                onMessageReceived: (result) {
                  print(result.message);
                  _socialLoginController.checkSocialCodeDTO(result.message);
                },
              ),
            ]),
          ),
    );
  }
}
