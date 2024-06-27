import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.saveFilters, required this.filters}) : super(key: key);
  static const routName = 'FiltersScreen';
  final Function saveFilters;
  final Map<String,bool?> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? glutenFree = false;
  bool? lactoseFree = false;
  bool? vegan = false;
  bool? vegetarian = false;
  @override
  void initState() {
     glutenFree = widget.filters['gluten'];
     lactoseFree = widget.filters['lactose'];
     vegan = widget.filters['vegan'];
     vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed:()
            {
              Map<String,bool?> filters ={
                'gluten':glutenFree,
                'lactose':lactoseFree,
                'vegan':vegan,
                'vegetarian':vegetarian,
              };
              widget.saveFilters(filters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  glutenFree!,
                  'Gluten Free',
                  'Only include gluten free meals',
                  (value) {
                    setState(() {
                      glutenFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  lactoseFree!,
                  'Lactose Free',
                  'Only include lactose free meals',
                      (value) {
                    setState(() {
                      lactoseFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  vegan!,
                  'Vegan',
                  'Only include vegan meals',
                      (value) {
                    setState(() {
                      vegan = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  vegetarian!,
                  'Vegetarian',
                  'Only include vegetarian meals',
                      (value) {
                    setState(() {
                      vegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}

Widget buildSwitchListTile(bool value, String text, String subtitle, ValueChanged<bool> onChanged) {
  return SwitchListTile(
    value: value,
    onChanged: onChanged,
    title: Text(text),
    subtitle: Text(subtitle),
    activeTrackColor: Colors.amberAccent,
    activeColor: Colors.amberAccent,
  );
}
