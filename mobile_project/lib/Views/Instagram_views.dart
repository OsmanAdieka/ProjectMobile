// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramWebView extends StatefulWidget {
  const InstagramWebView({Key? key}) : super(key: key);

  @override
  State<InstagramWebView> createState() => _InstagramWebViewState();
}

class _InstagramWebViewState extends State<InstagramWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(

        /// Previous code
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://www.instagram.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
