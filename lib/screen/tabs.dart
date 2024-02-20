import 'package:flutter/material.dart';

import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

enum ScreenName { meals, filters }

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _activeScreenIndex = 0;

  void _setActiveScreen(int index) {
    setState(() {
      _activeScreenIndex = index;
    });
  }

  void _selectScreen(ScreenName screenName) {
    switch (screenName) {
      case ScreenName.meals:
        Navigator.of(context).pop();
        break;
      case ScreenName.filters:
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();
    var activeScreenTitle = 'Categories';

    if (_activeScreenIndex == 1) {
      activeScreen = const MealsScreen(meals: []);
      activeScreenTitle = 'Makanan Favorit';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setActiveScreen,
        currentIndex: _activeScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
