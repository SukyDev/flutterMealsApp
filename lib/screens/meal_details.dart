//18.01.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_event.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_state.dart';
import 'package:multi_screen_app_bloc/models/favorite_meals.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  State<MealDetailsScreen> createState() {
    return _MealDetailsScreenState();
  }
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {

  final bloc = FavoritesBloc();
  List<Meal> favoriteMeals = [];

  @override
  void initState() {
    favoriteMeals = List.of(bloc.state.favoriteMeals.meals!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final isFavorite = favoriteMeals.contains(widget.meal);

    return BlocProvider(
        create: (context) => FavoritesBloc(),
        child: _mealDetailsWidget(isFavorite, favoriteMeals));
  }

  Widget _mealDetailsWidget(bool isFavorite, List<Meal> favoriteMeals) {
    final bloc = FavoritesBloc();
    bool isMealFavorite = isFavorite;
    bool wasAdded = false;
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.meal.title),
            actions: [
              IconButton(
                onPressed: () {
                  // final wasAdded = ref
                  //     .read(favoriteMealsProvider.notifier)
                  //     .toggleMealFavoriteStatus(meal);

                  if (favoriteMeals!.contains(widget.meal)) {
                    favoriteMeals.remove(widget.meal);
                    context.read<FavoritesBloc>().add(
                      AddedMealToFavorites(
                        FavoriteMeals(meals: favoriteMeals),
                      ),
                    );
                  } else {
                    favoriteMeals.add(widget.meal);

                    context.read<FavoritesBloc>().add(
                      AddedMealToFavorites(
                        FavoriteMeals(meals: favoriteMeals),
                      ),
                    );
                  }

                  setState(() {
                    if (favoriteMeals!.contains(widget.meal)) {
                      wasAdded = false;
                      isMealFavorite = false;
                    } else {
                      wasAdded = true;
                      isMealFavorite = true;
                    }
                  });

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text( wasAdded ? 'You added ${widget.meal.title} to favorites'
                    : 'You removed ${widget.meal.title} from favorites',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  );
                },
                icon: Icon(isMealFavorite ? Icons.star : Icons.star_border),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  widget.meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 14,
                ),
                for (final ingredient in widget.meal.ingredients)
                  Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 14,
                ),
                for (final step in widget.meal.steps)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
