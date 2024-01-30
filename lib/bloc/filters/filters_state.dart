import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/providers/filters_provider.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';

class FiltersState extends Equatable {

  FiltersState({this.filters = const Filters()});

  Filters filters;

  FiltersState copyWith({required filters}) {
    return FiltersState(
        filters: filters ?? this.filters
    );
  }

  factory FiltersState.fromJson(Map<String, dynamic> json) {
    return FiltersState(
      filters: Filters.fromJson(json['filters']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'filters': filters.toJson()};
  }

  @override
  List<Object?> get props => [filters];
}