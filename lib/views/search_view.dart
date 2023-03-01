import 'package:flutter/material.dart';
import 'package:step1/components/news_card.dart';
import 'package:step1/constans/appText.dart';
import 'package:step1/models/top_News.dart';
import 'package:step1/services/fech_service.dart';
import 'package:step1/theme/appColors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TopNews? topNews;
  bool isSearch = false;
  final controller = TextEditingController();

  Future<void> fetchData(String text) async {
    isSearch = true;
    setState(() {});
    topNews = await NewsRepo().fetchSearchNews(text);
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: TextField(
          controller: controller,
          onSubmitted: (value) async {
            await fetchData(value);
          },
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 176, 135, 52),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await fetchData(controller.text);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isSearch == false && topNews != null) {
      return ListView.builder(
        itemCount: topNews!.articles.length,
        itemBuilder: (context, index) {
          final news = topNews!.articles[index];
          return NewsCard(news: news);
        },
      );
    } else {
      return const Center(
        child: Text(AppText.searchTitle),
      );
    }
  }
}
