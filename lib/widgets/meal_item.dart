import 'package:flutter/material.dart';
import 'package:food_dishes/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal
    });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge, // Stack basically removes or doesn't allow for the shape, or any widgets from top side
      //given toa stack. SO by setting clipBehavior to hard it then passes and doens't get removed like that
      elevation: 4,
      child: InkWell(
        onTap: () {},
        child: Stack( //Stack places widgets one on one like a background and on it something
                      // FadeIn allows for a smooth transparent look 
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), //Transition till it loads
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,),

            // Using it for on to Appear above the other
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color:  Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // ...
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)
                      )
                    ],
                  ),
                ),

            )
            )

          ],
        ),
      ),
    );
  }
}