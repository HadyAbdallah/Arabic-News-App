import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/ArticleModel.dart';

import '../Services/NewsService.dart';
import 'NewsListViews.dart';

class NewsListViewBulder extends StatefulWidget {
  const NewsListViewBulder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBulder> createState() => _NewsListViewBulderState();
}

class _NewsListViewBulderState extends State<NewsListViewBulder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(newsType: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(news: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: Center(
                      child: Text("Oops there was an error, try later"),
                    )));
          } else {
            return const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: Center(child: CircularProgressIndicator()),
            ));
          }
        });
  }
}
