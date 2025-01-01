import 'package:flutter/material.dart';
import 'package:food_dishes/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //body: ,
    );
  }
}