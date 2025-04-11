import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/providers/favorites_provider.dart';
import 'package:food_dishes/providers/filters_provider.dart';
import 'package:food_dishes/screens/categories.dart';
import 'package:food_dishes/screens/filters.dart';
import 'package:food_dishes/screens/meals.dart';
import 'package:food_dishes/widgets/main_drawer.dart';

const kInitialFilters = { //k is flutter convention for global filters
  Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
};
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
 
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>
      (MaterialPageRoute(builder: (context) => const FiltersScreen(
      )));

    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    
    Widget activePage = CategoriesScreen(
    availableMeals: availableMeals,);
    // ignore: unused_local_variable
    var activePageTitle = 'Categories';

    if (_selectedPageIndex  == 1) {
      final favoriteMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals, 
        );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic...'),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],)
    );
  }
}