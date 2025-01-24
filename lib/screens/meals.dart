import 'package:flutter/material.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:food_dishes/screens/meal_details_screen.dart';
import 'package:food_dishes/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen ({super.key, required this.meals, this.title});

  final String? title;
  final List<Meal> meals;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Center (child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh... Nothing here',style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16,),
            Text('Try Selecting a different category',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ))

          ],
        ),); 

      if (meals.isNotEmpty) {
        content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
        return MealItem(meal: meals[index],
        onSelectMeal: (meal) {
          selectMeal(meal, context);
        },);
      });
      }

      if (title == null) {
        return content;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    );
  }
}