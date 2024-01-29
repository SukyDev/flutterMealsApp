import 'package:riverpod/riverpod.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';

// 22.01. StateNotifierProvider zavisi i od druge klase - StateNotifier
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // U super prosledjujemo initial data (tipa koji je naveden u StateNotifier)
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    // Koristeci StateNotifier ne mozemo menjati objekat u memoriji,
    // nego moramo da ga zamenimo skroz (druga memorijska adresa).
    // 'state' je trenutni objekat naveden u StateNotifier
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // .where nam daje novu listu
      state = state.where((checkedMeal) => checkedMeal.id != meal.id).toList();
      return false;
    } else {
      // pravimo novu listu tako sto sve elemente liste ponovo
      // ubacujemo kao pojedinacne elemente koristeci ... 
      // a nakon toga dodajemo i novi meal u favorite
      state = [...state, meal];
      return true;
    }
  }
}

// 22.01. provider koji prati izmene (za razliku od obicnog Provider-a
// koji samo deli podatke preko cele aplikacije).
// Da bi aplikacija znala koje podatke treba da prati,
// Navodimo Notifier klasu i tip podatka koji ta klasa vraca.
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});