import 'package:flutter/material.dart';
import 'package:news/Models/CategoriesModel.dart';
import 'package:news/Views/CategoryView.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: categoryModel.categoryName.toLowerCase(),
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        height: 125,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(categoryModel.image),
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          categoryModel.categoryName,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
