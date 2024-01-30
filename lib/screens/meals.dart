import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_screen_app_bloc/bloc/filters/filters_bloc.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';
import 'package:multi_screen_app_bloc/screens/meal_details.dart';
import 'package:multi_screen_app_bloc/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  List<Meal> meals;

  @override
  State<StatefulWidget> createState() {
    return _MealsScreen();
  }
}

class _MealsScreen extends State<MealsScreen> {
  final bloc = FiltersBloc();

  @override
  void initState() {
    if (widget.title != null) {
      checkFilters();
    }
    super.initState();
  }

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  void checkFilters() {
    final bloc = FiltersBloc();
    final availableMeals = widget.meals.where((meal) {
      if (bloc.state.filters.glutenFree && !meal.isGlutenFree) {
        return false;
      }
      if (bloc.state.filters.lactoseFree && !meal.isLactoseFree) {
        return false;
      }
      if (bloc.state.filters.vegetarian && !meal.isVegetarian) {
        return false;
      }
      if (bloc.state.filters.vegan && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    setState(() {
      widget.meals = availableMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Oh no... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (widget.meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: widget.meals[index],
          selectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    if (widget.title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: content,
        // (children: [
        // if (meals.length < 1)
        // Text('No meals in list')
        // else
        // ...meals.map((meal) => Meal(id: meal.id, categories: meal.categories,
        // title: meal.title, imageUrl: meal.imageUrl, ingredients: meal.ingredients, steps: meal.steps,
        // duration: meal.duration, complexity: meal.complexity, affordability: meal.affordability,
        // isGlutenFree: meal.isGlutenFree, isLactoseFree: meal.isLactoseFree, isVegan: meal.isVegan, isVegetarian: isVegetarian)).toList()
        // ],
      );
    }
  }
}
