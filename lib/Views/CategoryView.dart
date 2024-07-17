import 'package:flutter/material.dart';
import 'package:news/Widgets/NewsListViewBulder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBulder(category: category),
        ],
      ),
    );
  }
}
