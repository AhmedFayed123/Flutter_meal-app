import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favoorites_providers.dart';
import 'package:meal_app/providers/filters_providers.dart';
import 'package:meal_app/providers/nav_bar_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final availableMeals =ref.watch(filterMealsProviders);
    Widget activePage = CategoriesScreen( availableMeals: availableMeals,);
    var activeTitle = 'Categories';
    final int selectedPageIndex =ref.watch(navBarProvider);
    if(selectedPageIndex==1){
      final List<Meal> favoriteMeal = ref.watch(favoritesMealsProviders);
      activePage=MealsScreen(title: 'Your Favorites Meals', meal: favoriteMeal,);
      activeTitle='Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      drawer: MainDrawer(onSelectScreen: (String identifier){
        Navigator.of(context).pop();
        if(identifier=='filters'){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx)=>FiltersScreen(
              ))
          );
        }
      },),
    );
  }
}
