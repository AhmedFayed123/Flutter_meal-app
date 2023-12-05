import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoritesProvidersNotifier extends StateNotifier<List<Meal>>{
  FavoritesProvidersNotifier():super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final isExisting = state.contains(meal);
    if(isExisting){
      state = state.where((element) => element.id!=meal.id).toList();
    return false;
    }
    else{
      state = [...state,meal];
      return true;
    }
  }


}
final favoritesMealsProviders =
      StateNotifierProvider<FavoritesProvidersNotifier,List<Meal>>((ref) {
  return FavoritesProvidersNotifier();
});