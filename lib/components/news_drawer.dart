import 'package:flutter/material.dart';
import 'package:news_app_mvvm/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import '../constants/countries.dart';
import '../constants/utils.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecorationStyles.boxShadow,
              child: Padding(
                padding: NewsPadding.newsPaddingAllLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      NewsStrings.appTitle,
                      style: NewsTextStyles.drawerHeaderStyleMid,
                    ),
                    Text(
                      NewsStrings.appLangTitle,
                      style: NewsTextStyles.drawerHeaderStyleLow,
                    ),
                  ],
                ),
              )),
          Expanded(
              child: ListView.builder(
            itemCount: Country.countryList.length,
            itemBuilder: (context, index) => ListTile(
              selected: Country.countryList[index].name ==
                      Provider.of<NewsViewModel>(context).lang
                  ? true
                  : false,
              title: Text(Country.countryList[index].name),
              onTap: () {
                final news = Provider.of<NewsViewModel>(context, listen: false);
                final selectedCountry = Country.countryList[index];
                news.lang = selectedCountry.name;
                news.langCode = selectedCountry.code;
                news.page = 1;
                news.fetchNews();
                Navigator.pop(context);
              },
            ),
          )),
        ],
      ),
    );
  }
}
