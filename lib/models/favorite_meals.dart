import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

class FavoriteMeals extends Equatable {
  List<Meal>? meals;

  FavoriteMeals({this.meals = const [],});

  FavoriteMeals.copyWith({List<Meal>? meals}) {
    FavoriteMeals(meals: meals ?? this.meals);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [meals];
}
