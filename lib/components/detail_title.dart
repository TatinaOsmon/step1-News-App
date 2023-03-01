import 'package:flutter/material.dart';
import 'package:step1/models/articles.dart';
import 'package:step1/theme/appColors.dart';

class NewDetailTitle extends StatelessWidget {
  const NewDetailTitle({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
