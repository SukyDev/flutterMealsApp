import 'package:flutter/material.dart';
import 'package:multi_screen_app_bloc/data/dummy_data.dart';
import 'package:multi_screen_app_bloc/screens/meals.dart';
import 'package:multi_screen_app_bloc/widgets/category_grid_item.dart';
import 'package:multi_screen_app_bloc/models/category.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

// 17.01.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

// 17.01. Navigate to other screen. Moramo dodati BuildContext context jer ga u
// StatelessWidget-u nemamo po default-u
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: 2 / 2,
          mainAxisSpacing: 20),
      children: [
        for (final categoryData in availableCategories)
          CategoryGridItem(
            category: categoryData,
            onSelectCategory: () {
              _selectCategory(context, categoryData);
            },
          ),
      ],
    );
  }
}
