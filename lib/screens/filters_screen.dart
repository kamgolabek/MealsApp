import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegeterian = widget.currentFilters['vegetarian'];
    super.initState();
  }

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

  List<Widget> buildFiltersWidgets() {
    return [
      buildSwitchListTile('Gluten-free', 'Only gluten-free meals', _glutenFree,
          (newVal) {
        setState(() {
          _glutenFree = newVal;
        });
      }),
      buildSwitchListTile(
          'Lactose-free', 'Only lactose-free meals', _lactoseFree, (newVal) {
        setState(() {
          _lactoseFree = newVal;
        });
      }),
      buildSwitchListTile('Vegetarian', 'Only vegetarian meals', _vegeterian,
          (newVal) {
        setState(() {
          _vegeterian = newVal;
        });
      }),
      buildSwitchListTile('Vegan', 'Only vegan meals', _vegan, (newVal) {
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegeterian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
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
