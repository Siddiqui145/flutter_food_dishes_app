// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_dishes/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;
  // Referred the blueprint we created and now accessing and using that specific mentioned data here

  @override
  Widget build(BuildContext context) {
    //Inkwell gives a feedback when user taps, gesture woundn't give that
    return InkWell(onTap: onSelectCategory ,
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(36),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          
          gradient: LinearGradient(colors:[category.color.withOpacity(0.55),category.color.withOpacity(0.9),],
          begin: Alignment.topLeft, end: Alignment.bottomRight)//Colors.black, Colors.white] ),
          
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface
        )),
      ),
    );
  }
}
