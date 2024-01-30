import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_event.dart';
import 'package:multi_screen_app_bloc/bloc/favorites/favorites_state.dart';

class FavoritesBloc extends HydratedBloc<FavoritesEvent, FavoritesState> {
FavoritesBloc() : super(FavoritesState());

}