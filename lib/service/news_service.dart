import 'dart:io';

import 'package:dio/dio.dart';

import '../model/news_model.dart';

class NewsService {
  String apiToken = "";
  // NEWS API PAGE https://www.thenewsapi.com

  Future<List<NewsModel>?> fetchNews(
      String lang, int page, String category) async {
    final response = await Dio().get(
        'https://api.thenewsapi.com/v1/news/all?api_token=$apiToken&language=$lang&page=$page&categories=$category');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data["data"];
      if (datas is List) {
        return datas.map((e) => NewsModel.fromJson(e)).toList();
      }
    } else {
      return [];
    }
  }
}
