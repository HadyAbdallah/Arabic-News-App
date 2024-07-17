import 'package:dio/dio.dart';

import '../Models/ArticleModel.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String newsType}) async {
    try {
      Response response = await dio.get(
          'https://gnews.io/api/v4/top-headlines?country=eg&category=$newsType&apikey=c7bd4e2b68997a57ec7bd93dee549fbf');

      Map<String, dynamic> JsonData = response.data;
      print(JsonData);
      List<dynamic> articles = JsonData['articles'];
      List<ArticleModel> Myarticles = [];

      for (var article in articles) {
        Myarticles.add(ArticleModel(
            url: article['url'],
            image: article['image'],
            title: article['title'],
            subTitle: article['description']));
      }
      return Myarticles;
    } catch (e) {
      return [];
    }
  }
}
