import 'package:flutter/material.dart';
import 'package:news/Widgets/NewsListViewBulder.dart';

import '../Widgets/AppBar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.search});
  final String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewsListViewBulderForSearch(search: search),
        ],
      ),
    );
  }
}
