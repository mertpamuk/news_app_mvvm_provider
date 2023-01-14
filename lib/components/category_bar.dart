import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/categories.dart';
import '../constants/utils.dart';
import '../view_model/news_view_model.dart';

SizedBox buildCategoryBar(context) {
  final news = Provider.of<NewsViewModel>(context);
  return SizedBox(
    height: 40,
    child: Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: NewsCategories.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: NewsPadding.newsPaddingAllMin,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor:
                        news.category == NewsCategories.categories[index]
                            ? BoxDecorationStyles.newsPrimaryColor
                            : Colors.white,
                    side: BorderSide(
                        width: 2, color: BoxDecorationStyles.newsPrimaryColor)),
                child: Text(
                  NewsCategories.categories[index],
                  style: TextStyle(
                      color: news.category == NewsCategories.categories[index]
                          ? Colors.white
                          : BoxDecorationStyles.newsPrimaryColor),
                ),
                onPressed: () {
                  news.category = NewsCategories.categories[index];
                  news.fetchNews();
                },
              ),
            );
          }),
    ),
  );
}
