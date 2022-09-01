import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const WebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return WebView(url: url);
  }
}
