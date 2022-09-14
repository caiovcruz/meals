import 'package:flutter/material.dart';
import 'package:meals/screens/category_meal_detail_screen.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        AppRoutes.home: (_) => const TabsScreen(),
        AppRoutes.categories: (_) => const CategoriesScreen(),
        AppRoutes.categoryMeals: (_) =>
            CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.categoryMealDetail: (_) => const CategoryMealDetailScreen(),
        AppRoutes.favorites: (_) => const FavoritesScreen(),
        AppRoutes.settings: (_) =>
            SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },
    );
  }
}
