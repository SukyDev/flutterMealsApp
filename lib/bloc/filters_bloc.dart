import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:multi_screen_app_bloc/models/filters.dart';
import 'package:multi_screen_app_bloc/providers/filters_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:multi_screen_app_bloc/bloc/filters_event.dart';
import 'package:multi_screen_app_bloc/bloc/filters_state.dart';

class FiltersBloc extends HydratedBloc<FiltersEvent, FiltersState> {
  FiltersBloc()
      : super(
          FiltersState(filters: const Filters())
        ) {

    on<GlutenFilterChanged>((event, emit) {
      bool glutenFree = !state.filters.glutenFree;
      Filters filters = state.filters.copyWith(glutenFree: glutenFree);
     emit(state.copyWith(
      filters: filters
     ));
    });

    on<LactoseFilterChanged>((event, emit) {
      bool lactoseFree = !state.filters.lactoseFree;
      Filters filters = state.filters.copyWith(lactoseFree: lactoseFree);
     emit(state.copyWith(
      filters: filters
     ));
    });

    on<VegetarianFilterChanged>((event, emit) {
      bool vegetarian = !state.filters.vegetarian;
      Filters filters = state.filters.copyWith(vegetarian: vegetarian);
     emit(state.copyWith(
      filters: filters
     ));
    });

    on<VeganFilterChanged>((event, emit) {
      bool vegan = !state.filters.vegetarian;
      Filters filters = state.filters.copyWith(vegan: vegan);
     emit(state.copyWith(
      filters: filters
     ));
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

// Ovo je bloc

// SignUpBloc({
//     required UserRepository userRepository,
//   })  : _userRepository = userRepository,
//         super(const SignUpState()) {
//     // State is set back to InitialFormStatus in order to prevent snack bar from
//     // showing after the error was already shown.
//     // Maybe think of some other name for state
//     on<SignUpEmailChanged>((event, emit) {
//       emit(state.copyWith(
//           email: event.email, formStatus: const InitialFormStatus()));
//     });

//     on<SignUpPasswordChanged>((event, emit) {
//       emit(state.copyWith(
//           password: event.password, formStatus: const InitialFormStatus()));
//     });

//     on<SignUpDisplayNameChanged>((event, emit) {
//       emit(state.copyWith(
//           password: event.displayName, formStatus: const InitialFormStatus()));
//     });

//     on<SignUpSubmittedEvent>((event, emit) async {
//       if (state.isFormValid) {
//         // emit(state.copyWith(formStatus: FormSubmissionInProgress()));
//         // var response = await _userRepository.loginWithFirebase(
//         //     email: state.email, password: state.password);
//         //
//         // if (response.user != null) {
//         //   UserData user = UserData(
//         //       displayName: response.user!.displayName!,
//         //       email: response.user!.email!,
//         //       photoURL: response.user!.photoURL!,
//         //       refreshToken: response.user!.refreshToken!,
//         //       uid: response.user!.uid);
//         //
//         //   _userRepository.saveUser(user);
//         //   emit(state.copyWith(formStatus: FormSubmissionSuccess()));
//         // } else {
//         //   emit(state.copyWith(
//         //       formStatus:
//         //       FormSubmissionFailed(exception: 'Invalid credentials')));
//         // }
//       }
//     });
//   }
// }
