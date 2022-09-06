import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyews_app/data/model/news_article.dart';
import 'package:nyews_app/ui/article_detail_page.dart';
import 'package:nyews_app/widgets/platform_widget.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('lib/assets/local_data.json'),
      builder: (context, snapshot) {
        final List<NewsArticle> articles = parseArticles(snapshot.data);
        return Material(
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildArticleItem(BuildContext context, NewsArticle article) {
    return Hero(
      tag: article.urlToImage,
      child: Material(
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, ArticleDetailPage.routeName,
                arguments: article);
          },
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Image.network(
            article.urlToImage,
            width: 100,
          ),
          title: Text(article.title),
          subtitle: Text(article.author),
        ),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iOSBuilder: _buildIos);
  }
}
