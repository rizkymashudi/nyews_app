import 'dart:convert';

class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticle({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  // named constructor
  factory NewsArticle.fromJson(Map<String, dynamic> article) => NewsArticle(
        author: article['author'],
        title: article['title'],
        description: article['description'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publishedAt: article['publishedAt'],
        content: article['content'],
      );
}

// Parse json
List<NewsArticle> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => NewsArticle.fromJson(json)).toList();
}
