import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:step1/constans/api_constans.dart';
import 'package:step1/models/top_News.dart';

class NewsRepo {
  final http.Client client = http.Client();

  Future<TopNews?> fetchTopNews([String? domain]) async {
    final uri = Uri.parse(ApiConst.topNews(domain));

    final response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      final topNews = TopNews.fromJson(data);

      return topNews;
    }
    return null;
  }

  Future<TopNews?> fetchSearchNews([String? text]) async {
    final uri = Uri.parse(ApiConst.searchNews(text));

    final response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      final topNews = TopNews.fromJson(data);

      return topNews;
    }
    return null;
  }
}
