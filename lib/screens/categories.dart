import 'package:flutter/material.dart';
import 'package:food_dishes/data/dummy_data.dart';
import 'package:food_dishes/models/category.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:food_dishes/screens/meals.dart';
import 'package:food_dishes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,
  required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen( 
      title: category.title , 
      meals: filteredMeals,
      onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Select your Category"),
    //   ),
      //Using a Gridview for proper displaying 2 together
      return GridView(
        padding: const EdgeInsets.all(16),
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 20, mainAxisSpacing: 20), 

    children: [
      for (final category in availableCategories)
      CategoryGridItem(category: category, onSelectCategory: () {
        _selectCategory(context, category);
      },)
    ],
    );
  }
}