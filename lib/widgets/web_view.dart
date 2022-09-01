import 'package:flutter/material.dart';
import 'package:nyews_app/widgets/custom_scaffold.dart';

class WebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const WebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(url: url),
    );
  }
}
