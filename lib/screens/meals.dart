import 'package:flutter/material.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';
import 'package:multi_screen_app_bloc/screens/meal_details.dart';
import 'package:multi_screen_app_bloc/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
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

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          selectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
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
