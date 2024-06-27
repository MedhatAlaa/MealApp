import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/login_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/taps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool?> filters ={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> availableMeal=dummyMeals;
  List<Meal>favoriteMeals=[];
  void saveFilter(Map<String,bool?> filtersData)
  {
    setState(() {
      filters=filtersData;
      availableMeal=dummyMeals.where((meal)
      {
        if(filters['gluten']==true && meal.isGlutenFree==false)
        {
          return false;
        }
        if(filters['lactose']==true && meal.isLactoseFree==false)
        {
          return false;
        }
        if(filters['vegan']==true && meal.isVegan==false)
        {
          return false;
        }
        if(filters['vegetarian']==true && meal.isVegetarian==false)
        {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId)
  {
    final tapedIndex=favoriteMeals.indexWhere((meal) =>meal.id==mealId);

    if(tapedIndex>=0)
    {
      setState(() {
        favoriteMeals.removeAt(tapedIndex);
      });
    }
    else
    {
      setState(() {
        favoriteMeals.add(dummyMeals.firstWhere((meal) =>meal.id==mealId));
      });
    }
  }

  bool isFavorite(String id)
  {
    return favoriteMeals.any((meal) =>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229,1),
        textTheme:ThemeData.light().textTheme.copyWith(
          bodyText1:const TextStyle(
            fontSize: 17.0,
          ),
          bodyText2:const TextStyle(
            fontSize: 16.0,
          ),
          subtitle1:const TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/':(context)=> const LoginScreen(),
        TapsScreen.routName:(context)=>TapsScreen(favoriteMeals: favoriteMeals,),
        'categoryMealScreen':(context)=> CategoryMealScreen(availableMeal: availableMeal,),
        // 'MealDetails':(context)=>const MealDetailScreen(),
        MealDetailScreen.routName:(context)=> MealDetailScreen(toggleFavorite: toggleFavorite, isFavorite: isFavorite,),
        FiltersScreen.routName:(context)=> FiltersScreen(saveFilters:saveFilter, filters: filters,),
        LoginScreen.routName:(context)=>const LoginScreen(),
      },
    );
  }
}
