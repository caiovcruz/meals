import 'package:flutter/material.dart';

import '../components/category_meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoryMealsScreen({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return CategoryMealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
