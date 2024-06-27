import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/taps_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            height: 120.0,
            width: double.infinity,
            color: Colors.amberAccent,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(TapsScreen.routName);
          }),
          buildListTile('Filters', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}

Widget buildListTile(String text, IconData icon, GestureTapCallback tap) {
  return ListTile(
    onTap: tap,
    title: Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoCondensed',
      ),
    ),
    leading: Icon(
      icon,
      size: 26,
    ),
  );
}
