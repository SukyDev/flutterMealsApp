import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/models/favorite_meals.dart';

class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class AddedMealToFavorites extends FavoritesEvent {
  const AddedMealToFavorites(this.favoriteMeals);

  final FavoriteMeals favoriteMeals;

  @override
  List<Object?> get props => [favoriteMeals];
}

class RemovedMealFromFavorites extends FavoritesEvent {
  const RemovedMealFromFavorites(this.favoriteMeals);

  final FavoriteMeals favoriteMeals;

  @override
  List<Object?> get props => [favoriteMeals];
}