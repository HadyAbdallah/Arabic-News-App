import 'package:flutter/material.dart';
import 'package:news/Widgets/CategoriesListViews.dart';
import '../Widgets/NewsListViewBulder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          
          physics: BouncingScrollPhysics(),
          slivers: [
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
