import 'package:flutter/material.dart';
import 'package:step1/models/articles.dart';
import 'package:step1/theme/appColors.dart';

class NewsDetailDescription extends StatelessWidget {
  const NewsDetailDescription({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.description ?? '',
      style: const TextStyle(
          color: AppColors.black, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}
