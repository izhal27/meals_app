import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filters.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorite_meals_provider.dart';
import 'package:meals/providers/filters_provider.dart';

enum ScreenName { meals, filters }

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _activeScreenIndex = 0;

  void _setActiveScreen(int index) {
    setState(() {
      _activeScreenIndex = index;
    });
  }

  void _selectScreen(ScreenName screenName) async {
    Navigator.of(context).pop();
    switch (screenName) {
      case ScreenName.filters:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ));
        break;
      case ScreenName.meals:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(meals: meals);
    var activeScreenTitle = 'Categories';

    if (_activeScreenIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(meals: favoriteMeals);
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
