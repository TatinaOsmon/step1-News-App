class ApiConst {
  static const apiKey = 'd1bd4cf9fec5494ebf967ee6e31916a3';
  static String topNews([String? domain]) =>
      'https://newsapi.org/v2/top-headlines?country=${domain ?? 'us'}&apiKey=$apiKey';
  static String searchNews(String? text) =>
      'https://newsapi.org/v2/everything?q=$text&apiKey=$apiKey ';

  static const String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpBAZafcETIewM5tuVRKUWoqpVNB5CKrIbGzOIB8IxWx40WQ2DK2MDkmbEin9_mu1K54Y&usqp=CAU';
}
