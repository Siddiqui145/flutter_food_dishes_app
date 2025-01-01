import 'package:flutter/material.dart';
import 'package:food_dishes/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

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
        return Text(meals[index].title);
      });
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content
    );
  }
}