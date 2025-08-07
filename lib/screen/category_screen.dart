import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_items.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category")),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        children: [
          ...availableCategories.map((category)=> CategoryGridItems(category: category)),

         /* for (final category in availableCategories)
            CategoryGridItems(category: category),*/
        ],
      ),
    );
  }
}  
