import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/filters_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/filters_state.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';

import '../bloc/filters_event.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  final bloc = FiltersBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(
        //         builder: (ctx) => const TabsScreen(),
        //       ),
        //     );
        //   }
        // }),
        body: BlocProvider(
          create: (context) => FiltersBloc(),
          child: _filtersScreen(),
        ));
  }

  Widget _filtersScreen() {
    return Center(
      child: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                value: state.filters.glutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    // Test git
                    context
                        .read<FiltersBloc>()
                        .add(GlutenFilterChanged(state.filters));
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: state.filters.lactoseFree,
                onChanged: (isChecked) {
                  setState(() {
                    context
                        .read<FiltersBloc>()
                        .add(LactoseFilterChanged(state.filters));
                    // changeLactoseFilter(isChecked);
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: state.filters.vegetarian,
                onChanged: (isChecked) {
                  setState(() {
                    context
                        .read<FiltersBloc>()
                        .add(VegetarianFilterChanged(state.filters));
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: state.filters.vegan,
                onChanged: (isChecked) {
                  setState(() {
                    context
                        .read<FiltersBloc>()
                        .add(VeganFilterChanged(state.filters));
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          );
        },
      ),
    );
  }
}
