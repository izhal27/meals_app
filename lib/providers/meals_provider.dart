import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) => dummyMeals);
