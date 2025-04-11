import 'package:flutter_riverpod/flutter_riverpod.dart';

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