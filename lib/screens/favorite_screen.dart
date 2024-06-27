
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.favoriteMeal,}) : super(key: key);
  final List<Meal>favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return const Center(
        child: Text(
          'No favorite yet - please add your favorite meal',
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      );
    }
   else
   {
     return ListView.builder(
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.all(10.0),
           child: MealItem(
             imageUrl: favoriteMeal[index].imageUrl,
             title: favoriteMeal[index].title,
             complexity: favoriteMeal[index].complexity,
             affordability: favoriteMeal[index].affordability,
             duration:favoriteMeal[index].duration,
             id: favoriteMeal[index].id,
             // deletedItem: deletedItem,
           ),
         );
       },
       itemCount: favoriteMeal.length,
     );
   }
  }
}
