import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/bloc/filters/filters_state.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

class FavoritesState extends Equatable {
  FavoritesState({required this.favoriteMeals});

  List<Meal> favoriteMeals;

  FavoritesState copyWith({required favoriteMeals}) {
    return FavoritesState(
        favoriteMeals: favoriteMeals ?? this.favoriteMeals
    );
  }

  factory FavoritesState.fromJson(Map<String, dynamic> json) {
    return FavoritesState(favoriteMeals: [].fromJson['favorites']);
  }

  @override
  List<Object?> get props => [favoriteMeals];
}