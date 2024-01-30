import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';
import 'package:multi_screen_app_bloc/bloc/filters/filters_event.dart';
import 'package:multi_screen_app_bloc/bloc/filters/filters_state.dart';

class FiltersBloc extends HydratedBloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersState(filters: const Filters())) {
    on<GlutenFilterChanged>((event, emit) {
      bool glutenFree = !state.filters.glutenFree;
      Filters filters = state.filters.copyWith(glutenFree: glutenFree);
      emit(state.copyWith(filters: filters));
    });

    on<LactoseFilterChanged>((event, emit) {
      bool lactoseFree = !state.filters.lactoseFree;
      Filters filters = state.filters.copyWith(lactoseFree: lactoseFree);
      emit(state.copyWith(filters: filters));
    });

    on<VegetarianFilterChanged>((event, emit) {
      bool vegetarian = !state.filters.vegetarian;
      Filters filters = state.filters.copyWith(vegetarian: vegetarian);
      emit(state.copyWith(filters: filters));
    });

    on<VeganFilterChanged>((event, emit) {
      bool vegan = !state.filters.vegetarian;
      Filters filters = state.filters.copyWith(vegan: vegan);
      emit(state.copyWith(filters: filters));
    });
  }

  @override
  FiltersState? fromJson(Map<String, dynamic> json) {
    return FiltersState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FiltersState state) {
    return state.toJson();
  }
}
