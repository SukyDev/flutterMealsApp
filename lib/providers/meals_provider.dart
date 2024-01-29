import 'package:riverpod/riverpod.dart';
import 'package:multi_screen_app_bloc/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

