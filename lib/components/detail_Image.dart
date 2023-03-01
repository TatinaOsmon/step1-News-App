// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:step1/constans/api_constans.dart';
import 'package:step1/models/articles.dart';

class NewsDetailImage extends StatelessWidget {
  const NewsDetailImage({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(
    //  imageUrl: news.urlToImage ?? ApiConst.image,
    // placeholder: (context, url) => Image.asset('assets/error.png'),
    // errorWidget: (context, url, error) => Image.asset('assets/error2.jpg'),
    // );
    return Image.network(
      news.urlToImage ?? ApiConst.image,
      fit: BoxFit.fitWidth,
    );
  }
}
