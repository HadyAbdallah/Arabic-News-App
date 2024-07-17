import 'package:flutter/material.dart';
import 'package:news/Models/ArticleModel.dart';

import 'NewsTile.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.news});

  final List<ArticleModel> news;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
          SliverChildBuilderDelegate(childCount: news.length, (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: NewsTile(artical: news[index]),
        );
      }),
    );
  }
}
