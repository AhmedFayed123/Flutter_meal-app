import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

import 'meals_providers.dart';
enum Filter{
  GlutenFree,
  Vegan,
  Vegetarian,
  LactoseFree
}
class FiltersProviders extends StateNotifier<Map<Filter,bool>>{

  FiltersProviders():super({
    Filter.GlutenFree: false,
    Filter.LactoseFree: false,
    Filter.Vegan: false,
    Filter.Vegetarian:false
  });

  void setFilters(Filter filter , bool isActive){
    state = {
      ...state,filter:isActive
    };
  }
  void setFilter(Map<Filter,bool> chosenFilters){
    state = chosenFilters;
  }


}

final filterProviders=StateNotifierProvider<FiltersProviders,Map<Filter,bool>>((ref) {
  return FiltersProviders();
});

final filterMealsProviders = Provider((ref) {
  final meals = ref.watch(mealsProviders);
  final activeFilters = ref.watch(filterProviders);
  return meals.where((meal) {
    if(activeFilters[Filter.GlutenFree]!&&!meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filter.LactoseFree]!&&!meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filter.Vegan]!&&!meal.isVegan){
      return false;
    }
    if(activeFilters[Filter.Vegetarian]!&&!meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
});