import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categoy_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pick your Category'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3/2,
          ),
          children: [
            for(final category in availableCategories)
              CategoryGridItem(category: category, availableMeals: widget.availableMeals,)
          ],
        ),
        builder: (BuildContext ctx, Widget? child) =>
          SlideTransition(
            position: Tween(
              begin: const Offset(0,.3),
              end: const Offset(0,0),
            ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo)),
            child:child,
          ),
      ),
    );
  }
}
