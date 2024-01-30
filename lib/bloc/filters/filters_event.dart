import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

final class GlutenFilterChanged extends FiltersEvent {
  const GlutenFilterChanged(this.filters);
  final Filters filters;

  @override
  List<Object> get props => [filters];
}

final class LactoseFilterChanged extends FiltersEvent {
  const LactoseFilterChanged(this.filters);
  final Filters filters;

  @override
  List<Object> get props => [filters];
}

final class VegetarianFilterChanged extends FiltersEvent {
  const VegetarianFilterChanged(this.filters);
  final Filters filters;

  @override
  List<Object> get props => [filters];
}

final class VeganFilterChanged extends FiltersEvent {
  const VeganFilterChanged(this.filters);
  final Filters filters;

  @override
  List<Object> get props => [filters];
}