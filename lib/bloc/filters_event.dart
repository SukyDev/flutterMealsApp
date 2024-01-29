import 'package:equatable/equatable.dart';
import 'package:multi_screen_app_bloc/providers/filters_provider.dart';
import 'package:bloc/bloc.dart';
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

// final class SignUpEmailChanged extends SignUpEvent {
//   const SignUpEmailChanged(this.email);
//   final String email;

//   @override
//   List<Object> get props => [email];
// }

// final class SignUpPasswordChanged extends SignUpEvent {
//   const SignUpPasswordChanged(this.password);
//   final String password;

//   @override
//   List<Object> get props => [password];
// }

// final class SignUpDisplayNameChanged extends SignUpEvent {
//   const SignUpDisplayNameChanged(this.displayName);
//   final String displayName;

//   @override
//   List<Object> get props => [displayName];
// }

// final class SignUpSubmittedEvent extends SignUpEvent {
//   const SignUpSubmittedEvent();
// }
