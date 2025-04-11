import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier(): super({
    Filter.glutenFree: false,   // initial value all as false
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });
  // now handling changes

void setFilter(Filter filter, bool isActive){
  state = { // spread operator for map values
    ...state,   // key value pairs are copied in the new map from the existing map
    filter: isActive,   // only one selected/modifed by the user would be changed rest all same
  };
}

  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }
}

final filterProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier()
);

final filteredMealsProvider = Provider((ref) {

  // whenever the value of the provider watched here changes, 
  //the below data would rebuild to reflect changes, similarly widgets automatically

  final meals = ref.watch(mealsProvider);   
  final activeFilters = ref.watch(filterProvider);

  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

});