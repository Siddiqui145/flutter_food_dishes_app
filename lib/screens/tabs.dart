import 'package:flutter/material.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:food_dishes/screens/categories.dart';
import 'package:food_dishes/screens/filters.dart';
import 'package:food_dishes/screens/meals.dart';
import 'package:food_dishes/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

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

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FiltersScreen()));
    }
    else {
    }
  }

  @override
  Widget build(BuildContext context) {
    
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
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