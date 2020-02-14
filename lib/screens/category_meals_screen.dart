import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals =
        DUMMY_MEALS.where((m) => m.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          // just my changes
          return MealItem(
            id: categoryMeals[idx].id,
            title: categoryMeals[idx].title,
            duration: categoryMeals[idx].duration,
            imageUrl: categoryMeals[idx].imageUrl,
            affordability: categoryMeals[idx].affordability,
            complexity: categoryMeals[idx].complexity,
          );

          // return Card(
          //   margin: EdgeInsets.all(22),
          //   elevation: 5,
          //   child: Column(
          //     children: <Widget>[
          //       Image.network(categoryMeals[idx].imageUrl),
          //       Text(categoryMeals[idx].title),
          //       ...categoryMeals[idx].ingredients.map((e) => Text(e)).toList(),
          //     ],
          //   ),
          // );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
