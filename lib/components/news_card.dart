import 'package:flutter/material.dart';
import 'package:step1/constans/api_constans.dart';
import 'package:step1/models/articles.dart';
import 'package:step1/views/detail_view.dart';
// ignore: unused_import
import 'package:step1/constants/api_constant.dart';
// ignore: duplicate_import
import 'package:step1/models/articles.dart';
// ignore: duplicate_import
import 'package:step1/views/detail_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailView(news: news),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  news.urlToImage ?? ApiConst.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                flex: 5,
                child: Text(
                  news.title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
