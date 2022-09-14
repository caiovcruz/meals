import 'package:flutter/material.dart';

import 'screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s cook?',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.pinkAccent,
              secondary: Colors.amber,
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              centerTitle: true,
            ),
      ),
      routes: {
        AppRoutes.home: (_) => const CategoriesScreen(),
        AppRoutes.categories: (_) => const CategoriesScreen(),
        AppRoutes.categoriesMeals: (_) => const CategoriesMealsScreen(),
      },
    );
  }
}
