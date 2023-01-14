import 'package:flutter/material.dart';
import 'package:news_app_mvvm/constants/utils.dart';
import 'package:news_app_mvvm/view/news_view.dart';
import 'package:news_app_mvvm/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: NewsStrings.appTitle,
        home: const NewsView(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: BoxDecorationStyles.newsPrimaryColor,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: BoxDecorationStyles.newsPrimaryColor),
          listTileTheme: ListTileThemeData(
              selectedTileColor: BoxDecorationStyles.newsPrimaryColor,
              selectedColor: Colors.white),
        ),
      ),
    );
  }
}
