import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals =
          widget.availableMeals.where((m) => m.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void removeMealItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((m) => m.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          // just my changes
          return MealItem(
            id: displayedMeals[idx].id,
            title: displayedMeals[idx].title,
            duration: displayedMeals[idx].duration,
            imageUrl: displayedMeals[idx].imageUrl,
            affordability: displayedMeals[idx].affordability,
            complexity: displayedMeals[idx].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
