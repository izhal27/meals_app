import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/model/meal.dart';

class FavoriteMealsNotivier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotivier() : super([]);

  bool toggleMealFavoriteStatus(meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotivier, List<Meal>>(
        (ref) => FavoriteMealsNotivier());
