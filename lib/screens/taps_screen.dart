import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'favorite_screen.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({Key? key,required this.favoriteMeals }) : super(key: key);
  final List<Meal>favoriteMeals;
  static const routName='TapsScreen';

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  int currentIndex=0;
  void tapedBar(value)
  {
    setState(() {
      currentIndex=value;
    });
  }

  List pages=[];
  @override
  void initState() {
   pages=[
    {
    'page':const CategoriesScreen(),
    'title':'Categories',
    },
    {
    'page': FavoriteScreen(favoriteMeal:widget.favoriteMeals,),
    'title':'Favorites',
    },
    {
    'page':SettingsScreen(),
    'title':'Settings',
    },
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(pages[currentIndex]['title']),
      ),
      body:pages[currentIndex]['page'] ,
      bottomNavigationBar:CurvedNavigationBar(
        onTap:(value)=>tapedBar(value),
        index:currentIndex ,
        backgroundColor: Colors.white,
        height: 60.0,
        color:Colors.pink,
        animationCurve:Curves.decelerate ,
        buttonBackgroundColor: Colors.yellowAccent,
        items:const [
          Icon(Icons.category),
          Icon(Icons.favorite),
          Icon(Icons.settings),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
