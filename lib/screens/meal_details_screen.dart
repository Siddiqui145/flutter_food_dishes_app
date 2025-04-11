import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:food_dishes/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
            
            final wasAdded = ref.read(favoritesMealsProvider.notifier).toggleMealFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                       Text(wasAdded ? 'Meal added as a Favorite' : 'Meal removed from Favorites')));
          },
          icon: const Icon(Icons.favorite))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(     //Singlechildscrollview or simple Listview
          children: [
            Image.network(meal.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
        ),
        
        const SizedBox(height: 14,),
        Text('Ingredients',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 14,),
        
        for (final ingredient in meal.ingredients)
          Text(ingredient,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),),
        const SizedBox(height: 14,),
        
        Text('Steps',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 14,),
        
        for (final step in meal.steps)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8
            ),
            child: Text(step,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
                  ),),
          ),
        
          ],
        ),
      )
      
      
      
    );
  }
}