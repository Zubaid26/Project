import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsArticle> newsArticles = [];

  Future<void> fetchNews() async {
    final url = Uri.parse('https://newsapi.org/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      setState(() {
        newsArticles = (jsonData['articles'] as List)
            .map((articleData) => NewsArticle(
                  title: articleData['title'],
                  description: articleData['description'],
                  imageUrl: articleData['image'],
                ))
            .toList();
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (BuildContext context, int index) {
          final article = newsArticles[index];

          return ListTile(
            leading: article.imageUrl.isNotEmpty
                ? Image.network(
                    article.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(width: 80, height: 80),
            title: Text(article.title),
            subtitle: Text(article.description),
          );
        },
      ),
    );
  }
}
