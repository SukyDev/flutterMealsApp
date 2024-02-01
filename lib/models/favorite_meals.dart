import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/data/dummy_data.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

class FavoriteMeals extends Equatable {
  final List<Meal> meals;

  const FavoriteMeals({
    this.meals = const [],
  });

  FavoriteMeals copyWith({List<Meal>? meals}) {
    return FavoriteMeals(
      meals: meals ?? this.meals
    );
  }

  factory FavoriteMeals.fromJson(Map<String, dynamic> json) {
    return FavoriteMeals(meals: json['favoriteMeals']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    String encoded = jsonEncode(meals);
    print("Encoded meals ${encoded}");
    data['favoriteMeals'] = encoded;
    print("Encoded data for meals ${data['favoriteMeals']}");
    return data;
  }

  @override
  List<Object?> get props => [meals];
}
