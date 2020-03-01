import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavoritesScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          // just my changes
          return MealItem(
            id: favMeals[idx].id,
            title: favMeals[idx].title,
            duration: favMeals[idx].duration,
            imageUrl: favMeals[idx].imageUrl,
            affordability: favMeals[idx].affordability,
            complexity: favMeals[idx].complexity,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
