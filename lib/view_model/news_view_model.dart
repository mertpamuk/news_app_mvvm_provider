import 'package:flutter/material.dart';
import 'package:news_app_mvvm/model/news_model.dart';
import 'package:news_app_mvvm/service/news_service.dart';

enum NewsState { IDLE, BUSY, ERROR }

class NewsViewModel extends ChangeNotifier {
  late NewsState _state;
  late List<NewsModel> newsList;
  int _page = 1;
  String _langCode = "en";
  String _lang = "English";
  String _category = "general";

  NewsViewModel() {
    newsList = [];
    _state = NewsState.IDLE;
    fetchNews();
  }

  NewsState get state => _state;

  set state(NewsState state) {
    _state = state;
    notifyListeners();
  }

  int get page => _page;
  set page(int page) {
    _page = page;
    notifyListeners();
  }

  String get langCode => _langCode;
  set langCode(String langCode) {
    _langCode = langCode;
    notifyListeners();
  }

  String get category => _category;
  set category(String category) {
    _category = category;
    notifyListeners();
  }

  String get lang => _lang;
  set lang(String lang) {
    _lang = lang;
    notifyListeners();
  }

  Future<List<NewsModel>> fetchNews() async {
    try {
      state = NewsState.BUSY;
      newsList =
          await NewsService().fetchNews(_langCode, _page, _category) ?? [];
      state = NewsState.IDLE;
      return newsList;
    } catch (e) {
      state = NewsState.ERROR;
      return [];
    }
  }
}
