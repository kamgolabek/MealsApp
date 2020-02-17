import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 140,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((m) => m.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Theme.of(ctx).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[idx]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, idx) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${idx + 1}'),
                      ),
                      title: Text(selectedMeal.steps[idx]),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
