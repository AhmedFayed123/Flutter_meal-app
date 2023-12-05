import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_providers.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProviders);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Filters'
        ),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.GlutenFree]!,
              onChanged: (bool value) {
                ref.read(filterProviders.notifier).setFilters(
                    Filter.GlutenFree, value);
              },
              title: Text(
                'Gluten Free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              subtitle: Text(
                'Only Include Gluten Free Meals',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.Vegan]!,
              onChanged: (bool value) {
                ref.read(filterProviders.notifier).setFilters(
                    Filter.Vegan, value);
              },
              title: Text(
                'Vegan',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              subtitle: Text(
                'Only Include Vegan Meals',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.Vegetarian]!,
              onChanged: (bool value) {
                ref.read(filterProviders.notifier).setFilters(
                    Filter.Vegetarian, value);
              },
              title: Text(
                'Vegetarian',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              subtitle: Text(
                'Only Include Vegetarian Meals',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.LactoseFree]!,
              onChanged: (bool value) {
                ref.read(filterProviders.notifier).setFilters(
                    Filter.LactoseFree, value);
              },
              title: Text(
                'Lactose Free',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              subtitle: Text(
                'Only Include Lactose Free Meals',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
    );
  }
}