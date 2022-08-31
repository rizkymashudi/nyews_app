import 'package:flutter/material.dart';
import 'package:nyews_app/model/news_article.dart';
import 'package:nyews_app/pages/detail_page.dart';
import 'package:nyews_app/pages/news_list.dart';
import 'package:nyews_app/widgets/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nyeus app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        DetailPage.routeName: (context) => DetailPage(
            article: ModalRoute.of(context)?.settings.arguments as NewsArticle),
        WebView.routeName: (context) =>
            WebView(url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
