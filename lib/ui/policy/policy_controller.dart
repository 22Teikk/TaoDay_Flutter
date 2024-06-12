import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyController extends GetxController {
  final isDone = false.obs;
  final isSelected = false.obs;
  final webViewController = WebViewController();

  @override
  void onInit() {
    super.onInit();
    webViewController
      ..loadFlutterAsset("assets/others/policy.html")
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'ARTICLE_SCROLL_CHANNEL',
        onMessageReceived: (progress) {
          isDone.value = true;
        },
      )
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            webViewController.runJavaScript(
              '''
              window.addEventListener('scroll', function() {
  if (window.innerHeight + window.scrollY >= document.body.scrollHeight) {
    let progress = (window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100;
    window.ARTICLE_SCROLL_CHANNEL.postMessage(progress);
  }
});
              ''',
            );
          },
        ),
      );
  }

  void setSelected(bool? value) {
    isSelected.value = value ?? false;
  }

  void setNotFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(IS_FIRST, false);
  }
}
