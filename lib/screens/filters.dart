import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      body: 
        Column(
          children: [
            //List tile layout but allows the user to toggle between, such as to turn on & off and simple and feasible solution for us
            SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, 
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            },
            title: Text('Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            subtitle: Text('Only include gluten-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),),
        
            SwitchListTile(
            value: activeFilters[Filter.vegetarian]!, 
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text('Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            subtitle: Text('Only include Vegetarian meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),),
        
            SwitchListTile(
            value: activeFilters[Filter.vegan]!, 
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text('Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            subtitle: Text('Only include Vegan meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),),
        
            SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!, 
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text('Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            subtitle: Text('Only include lactose-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),)
          ],
        ),
      );
  }
}