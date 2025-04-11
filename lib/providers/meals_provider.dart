import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_dishes/data/dummy_data.dart';

//need to access with a variable for further use 
final mealsProvider = Provider((ref) {
  return dummyMeals;
}); 