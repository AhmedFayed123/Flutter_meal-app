import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favoorites_providers.dart';

import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal,});

  final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoritesMeals =ref.watch(favoritesMealsProviders);
   final bool isFavorite = favoritesMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
             final wasAdd = ref.read(favoritesMealsProviders.notifier).toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasAdd?'Marked As Added':'Meal Is No Longer a Favorite'),
              ));
            },
              icon: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (child,animation){
                  return RotationTransition(turns: Tween<double>(begin: .8,end: 1).animate(animation),child: child,);
                },
                child: Icon(
                  isFavorite?Icons.star:Icons.star_border,
                  color: Colors.yellowAccent,
                  key: ValueKey(isFavorite),
                ),
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 14,),
            Text(
                'Ingredient',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            ),
            SizedBox(height: 14,),
            for(final ingredient in meal.ingredients)
              Text(
                ingredient,
                style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            SizedBox(height: 24,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 14,),
            for(final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              )
          ],
        ),
      )
    );
  }
}
