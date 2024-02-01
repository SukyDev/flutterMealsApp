import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/models/favorite_meals.dart';

class FavoritesState extends Equatable {
  FavoritesState({this.favoriteMeals = const FavoriteMeals()});

  FavoriteMeals favoriteMeals;

  FavoritesState copyWith({required favoriteMeals}) {
    return FavoritesState(
        favoriteMeals: favoriteMeals ?? this.favoriteMeals
    );
  }

  factory FavoritesState.fromJson(Map<String, dynamic> json) {
    return FavoritesState(
      favoriteMeals: FavoriteMeals.fromJson(json['favorites']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'favorites': favoriteMeals.toJson()};
  }

  @override
  List<Object?> get props => [favoriteMeals];
}