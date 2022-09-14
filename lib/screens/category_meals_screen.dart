import 'package:flutter/material.dart';

import '../components/category_meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = dummyMeals.where((meal) {
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
