import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widgets/category_grid_items.dart';

class CategoryScreen extends StatelessWidget {
   const CategoryScreen({super.key,required this.onToggleFavourite,});

  final void Function(Meal meal) onToggleFavourite;

  void _selectedCategory(BuildContext context, Category category) {
    final fiteredDummy =
        dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) =>
                MealsScreen(title: category.title, meals: fiteredDummy,onToggleFavourite: onToggleFavourite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItems(
            category: category,
            onSelectedCategory: () {
              _selectedCategory(context, category);
            },
          ),
        ),

        /* for (final category in availableCategories)
            CategoryGridItems(category: category, onSelectedCategory: () {
                _selectedCategory(context,category);
              },),*/
      ],
    );
  }
}
