import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/utils.dart';
import '../view_model/news_view_model.dart';

Row buildFloatingActionButtons(context) {
  final news = Provider.of<NewsViewModel>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          if (news.page > 1) {
            news.page--;
            news.fetchNews();
          }
        },
      ),
      NewsSizedBoxes.sizedBox10,
      FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          news.page++;
          news.fetchNews();
        },
      )
    ],
  );
}
