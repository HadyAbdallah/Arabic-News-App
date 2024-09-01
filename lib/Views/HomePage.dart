import 'package:flutter/material.dart';
import 'package:news/Widgets/CategoriesListViews.dart';

import '../Widgets/NewsListViewBulder.dart';
import 'SearchView.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  String? search;
  // String? categoryName;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
                child: TextField(
              onChanged: (value) {
                search = value;
              },
              onSubmitted: (value) {
                search = value;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SearchView(
                      search: search!,
                    );
                  },
                ));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search For...",
                label: Text('Search'),
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SearchView(
                          search: search!,
                        );
                      },
                    ));
                  },
                  child: Icon(Icons.search),
                ),
              ),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            NewsListViewBulder(
              category: "general",
            ),
          ],
        ),
      ),
    );
  }
}
