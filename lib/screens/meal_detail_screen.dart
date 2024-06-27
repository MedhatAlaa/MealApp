import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key, required this.toggleFavorite, required this.isFavorite}) : super(key: key);
  static const routName = 'MealDetails';
  final Function toggleFavorite;
  final Function isFavorite;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            detailText(context, 'Ingredients'),
            detailContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 7.0),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                  color: Colors.amberAccent,
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            detailText(context, 'Steps'),
            detailContainer(
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    selectMeal.steps[index],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  leading: CircleAvatar(
                    child: Text('#${index + 1}'),
                  ),
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>toggleFavorite(mealId),
        child:  Icon(
          isFavorite(mealId)?Icons.star:Icons.star_border,
          color: Colors.black,
          size: 25.0,
        ),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}

Widget detailText(context, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
    ),
  );
}

Widget detailContainer(Widget child) {
  return Container(
    height: 180.0,
    width: 300.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        )),
    child: child,
  );
}
