// ignore_for_file: unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:step1/components/news_card.dart';
// ignore: unused_import
import 'package:step1/constans/api_constans.dart';
import 'package:step1/constans/appText.dart';
import 'package:step1/constans/country_code.dart';
// ignore: unused_import
import 'package:step1/models/articles.dart';
import 'package:step1/models/top_News.dart';
import 'package:step1/services/fech_service.dart';
import 'package:step1/theme/appColors.dart';
// ignore: unused_import
import 'package:step1/views/detail_view.dart';
import 'package:step1/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;

  Future<void> fetchNews([String? domain]) async {
    topNews = null;
    setState(() {});
    topNews = await NewsRepo().fetchTopNews(domain);
    setState(() {});
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
        title: const Text(AppText.appBarText),
        backgroundColor: AppColors.appBar,
        actions: [
          PopupMenuButton(
            onSelected: (Country item) async {
              await fetchNews(item.domain);
            },
            itemBuilder: (context) {
              return countrySet
                  .map(
                    (e) => PopupMenuItem<Country>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (context, index) {
                final news = topNews!.articles[index];
                return NewsCard(news: news);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchView()),
        ),
        backgroundColor: AppColors.appBar,
        child: const Icon(Icons.search),
      ),
    );
  }
}
