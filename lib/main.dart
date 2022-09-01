import 'package:flutter/material.dart';
import 'package:nyews_app/model/news_article.dart';
import 'package:nyews_app/pages/detail_page.dart';
import 'package:nyews_app/pages/news_list.dart';
import 'package:nyews_app/styles/style.dart';
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
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextStyle,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ))),
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
