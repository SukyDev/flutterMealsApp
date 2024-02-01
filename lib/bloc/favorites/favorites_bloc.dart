import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_event.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_state.dart';
import 'package:multi_screen_app_bloc/data/dummy_data.dart';
import 'package:multi_screen_app_bloc/models/favorite_meals.dart';

import '../../models/meal.dart';

class FavoritesBloc extends HydratedBloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState(favoriteMeals: const FavoriteMeals())) {
    on<AddedMealToFavorites>((event, emit) {
      FavoriteMeals favoriteMeals = event.favoriteMeals.copyWith(meals: event.favoriteMeals.meals); //state.favoriteMeals.copyWith(meals: event.favoriteMeals.meals);
      emit(state.copyWith(favoriteMeals: favoriteMeals));
    });
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    return FavoritesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return state.toJson();
  }
}
