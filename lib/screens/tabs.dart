import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/filters/filters_bloc.dart';
import 'package:multi_screen_app_bloc/data/dummy_data.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';
import 'package:multi_screen_app_bloc/screens/categories.dart';
import 'package:multi_screen_app_bloc/screens/filters.dart';
import 'package:multi_screen_app_bloc/screens/meals.dart';
import 'package:multi_screen_app_bloc/widgets/main_drawer.dart';
import 'package:multi_screen_app_bloc/providers/filters_provider.dart';

const kInitialFilters = Filters(
  glutenFree: false,
  lactoseFree: false,
  vegetarian: false,
  vegan: false,
);

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  };

  void _showInfoMessage(String message) {}

  // void _toggleMealFrvoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   setState(() {
  //     if (isExisting) {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMessage('${meal.title} removed from favorites');
  //     } else {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage('${meal.title} added to favorites');
  //     }
  //   });
  // }

  var activePageTitle = 'Categories';

  void setIndex(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
      activePageTitle = selectedIndex == 0 ? 'Categories' : 'Favorites';
    });
  }

// 19.01. push sa vracanjem future data
// u push-u se navodi koji objekat i koji tip se vraca <Map<Filter, bool>>
  void _selectedScreen(String identifier) async {
    Navigator.of(context).pop();
    // if (identifier == 'filters') {
    //   final result = await Navigator.of(context).push<Map<Filter, bool>>(
    //     MaterialPageRoute(
    //       builder: (ctx) => FiltersScreen(
    //         currentFilters: _selectedFilters,
    //       ),
    //     ),
    //   );
    //   setState(() {
    //     _selectedFilters = result ?? kInitialFilters;
    //   });
    // }
    await Navigator.of(context).push<Filters>(
      MaterialPageRoute(
        builder: (ctx) => const FiltersScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //19.01. dodavanje vrednosti kategorijama. Takodje i riverpod 'ref' koji
    // prati stanje (i data) odabranog provider-a
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = dummyMeals;

    Widget selectedScreen;
    if (_selectedIndex == 0) {
      selectedScreen = CategoriesScreen(
        availableMeals: availableMeals,
      );
    } else {
      final favoriteMeals = [
        dummyMeals[0],
        dummyMeals[1],
        dummyMeals[2],
        dummyMeals[3]
      ];
      selectedScreen = MealsScreen(
        meals: favoriteMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _selectedScreen,
      ),
      body: BlocProvider<FiltersBloc>(create: (context) => FiltersBloc(),
      child: selectedScreen,)
      ,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: setIndex,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
