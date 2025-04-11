import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:food_dishes/providers/meals_provider.dart';
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
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage (String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
    Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal removed from Favorites');
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal successfully added as Favorite');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>
      (MaterialPageRoute(builder: (context) => FiltersScreen(
        currentFilters: _selectedFilters,
      )));

      setState(() {
        _selectedFilters = result ?? kInitialFilters ;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,
    availableMeals: availableMeals,);
    // ignore: unused_local_variable
    var activePageTitle = 'Categories';

    if (_selectedPageIndex  == 1) {
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus,);
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