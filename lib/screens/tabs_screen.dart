import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  child: Text('Categories'),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  child: Text('Favorites'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
