import 'package:flutter/material.dart';
import 'package:nyews_app/data/model/news_article.dart';
import 'package:nyews_app/widgets/web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final NewsArticle article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: article.urlToImage,
                  child: Image.network(article.urlToImage)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description),
                    const Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    const SizedBox(height: 10),
                    Text('Author: ${article.author}'),
                    const Divider(color: Colors.grey),
                    Text(
                      article.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Read more'),
                      onPressed: () {
                        Navigator.pushNamed(context, WebView.routeName,
                            arguments: article.url);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
