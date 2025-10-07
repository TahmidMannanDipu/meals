import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/category_screen.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  // d,cs.vn
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 3), content: Text(message)),
    );
  }

  void _toggleFavouriteMealStatus(Meal meal) {
    final isExisted = _favouriteMeals.contains(meal);
    setState(() {
      if (isExisted) {
        _favouriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer Favourite");
      } else {
        _favouriteMeals.add(meal);
        _showInfoMessage('Meal is favourite');
      }
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activePage =
        _selectPageIndex == 0
            ? CategoryScreen(onToggleFavourite: _toggleFavouriteMealStatus)
            : MealsScreen(
              meals: _favouriteMeals,
              onToggleFavourite: _toggleFavouriteMealStatus,
            );
    var activePageTitle =
        _selectPageIndex == 0 ? 'Categories' : 'Your favourite';
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
