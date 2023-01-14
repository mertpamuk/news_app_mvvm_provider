import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/utils.dart';
import '../view_model/news_view_model.dart';

AppBar buildAppBar(BuildContext context) {
  final news = Provider.of<NewsViewModel>(context);
  return AppBar(
    shape: RoundedRectangleBorder(borderRadius: NewsRadius.newsRadiusCircular),
    title: const Text('News app'),
    actions: [
      Padding(
        padding: NewsPadding.newsPaddingAllMid,
        child: Center(
          child: news.langCode == ""
              ? null
              : Text("${news.lang} | ${news.category}  | Page: ${news.page}"),
        ),
      ),
    ],
  );
}
