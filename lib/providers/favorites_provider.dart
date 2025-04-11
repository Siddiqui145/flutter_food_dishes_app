import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/models/meal.dart';


// main logic handled here, fav, wishlist, cart everything
// below only ref & return is used of that modified value
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); //initial value must be passed so empty!

  bool toggleMealFavoriteStatus(Meal meal) {
    
    final mealIsFavorite = state.contains(meal); //using state as it allows to get value and status

    if (mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else {
      state = [...state, meal];
      return true;
    }
    //triggering the status if fav => unfav & vice versa
  }
}

// created the provider & we use generic type for safety, & also use that provider as return for it.
final favoritesMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});