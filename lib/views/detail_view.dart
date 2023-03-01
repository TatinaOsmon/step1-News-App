import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step1/components/detail_button.dart';
import 'package:step1/constans/api_constans.dart';
import 'package:step1/models/articles.dart';
import 'package:step1/theme/appColors.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key, required this.news}) : super(key: key);
  final Articles news;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat("d,MMM, y. H:m").format(
      DateTime.parse(news.publishedAt),
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          title: Text(
            news.title,
            overflow: TextOverflow.fade,
          ),
          actions: news.url != null
              ? [
                  IconButton(
                      onPressed: () {
                        Share.share(news.url!);
                      },
                      icon: const Icon(Icons.share)),
                ]
              : null,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
          child: Column(
            children: [
              NewDetailTitle(news: news),
              const NewDetailDivider(),
              NewsDetailDate(time: time),
              NewsDetailImage(news: news),
              const SizedBox(
                height: 10,
              ),
              NewsDetailDescription(news: news),
              const SizedBox(height: 20),
              news.url != null
                  ? NewsDetailButton(
                      onPressed: () async {
                        final uri = Uri.parse(news.url!);
                        // ignore: avoid_print
                        print(news.url);

                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }
}

class NewDetailButton extends StatelessWidget {
  const NewDetailButton({
    super.key,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.appBar),
      child: const Text('READ MORE'),
    );
  }
}

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

class NewsDetailImage extends StatelessWidget {
  const NewsDetailImage({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      news.urlToImage ?? ApiConst.image,
      fit: BoxFit.fitWidth,
    );
  }
}

class NewsDetailDate extends StatelessWidget {
  const NewsDetailDate({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.grey,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          time,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class NewDetailDivider extends StatelessWidget {
  const NewDetailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.grey,
      height: 20,
      thickness: 2,
    );
  }
}

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
