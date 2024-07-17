import 'package:flutter/material.dart';

import '../Models/CategoriesModel.dart';
import 'CategoryCard.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> Categories = const [
    CategoryModel(categoryName: "Sports", image: "assets/sports.avif"),
    CategoryModel(categoryName: "Business", image: "assets/business.avif"),
    CategoryModel(
        categoryName: "Entertainment", image: "assets/entertaiment.avif"),
    CategoryModel(categoryName: "General", image: "assets/general.avif"),
    CategoryModel(categoryName: "Health", image: "assets/health.avif"),
    CategoryModel(categoryName: "Science", image: "assets/science.avif"),
    CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: Categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(categoryModel: Categories[index]);
          }),
    );
  }
}
