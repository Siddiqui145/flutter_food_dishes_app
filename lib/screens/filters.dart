import 'package:flutter/material.dart';


class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const TabsScreen()));
      //   }
      // },),
      body: Column(
        children: [
          //List tile layout but allows the user to toggle between, such as to turn on & off and simple and feasible solution for us
          SwitchListTile(
          value: _glutenFreeFilterSet, 
          onChanged: (isChecked) {
            setState(() {
              _glutenFreeFilterSet = isChecked;
            });
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
          contentPadding: const EdgeInsets.only(left: 34, right: 22),)
        ],
      ),
    );
  }
}