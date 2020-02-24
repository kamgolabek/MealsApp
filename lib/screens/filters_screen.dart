import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  List<Widget> buildFiltersWidgets(){
    return [
      buildSwitchListTile(
                    'Gluten-free', 'Only gluten-free meals', _glutenFree,
                    (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
      buildSwitchListTile(
                    'Lactose-free', 'Only lactose-free meals', _lactoseFree,
                    (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
      buildSwitchListTile(
                    'Vegetarian', 'Only vegetarian meals', _vegeterian,
                    (newVal) {
                  setState(() {
                    _vegeterian = newVal;
                  });
                }),
      buildSwitchListTile(
                    'Vegan', 'Only vegan meals', _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajdust meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ...buildFiltersWidgets(),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
