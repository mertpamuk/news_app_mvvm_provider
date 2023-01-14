import 'package:flutter/material.dart';
import 'package:news_app_mvvm/components/category_bar.dart';
import 'package:news_app_mvvm/components/news_drawer.dart';
import 'package:news_app_mvvm/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import '../components/app_bar.dart';
import '../components/floating_action_buttons.dart';
import '../components/news_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsViewModel>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildCategoryBar(context),
          Expanded(
              child: news.state == NewsState.BUSY
                  ? buildLoadingWidget()
                  : news.state == NewsState.ERROR
                      ? buildErrorWidget()
                      : buildListView(context))
        ],
      ),
      floatingActionButton: buildFloatingActionButtons(context),
      drawer: const NewsDrawer(),
    );
  }
}

Center buildErrorWidget() => const Center(child: Text('Something went wrong!'));

Center buildLoadingWidget() => const Center(child: CircularProgressIndicator());

Widget buildListView(BuildContext context) {
  final news = Provider.of<NewsViewModel>(context).newsList;
  return ListView.builder(
    itemCount: news.length,
    itemBuilder: (_, index) => NewsCard(newsModel: news[index]),
  );
}
