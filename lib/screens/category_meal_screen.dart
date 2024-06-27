import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({Key? key, required this.availableMeal}) : super(key: key);

  static const routName = 'categoryMealScreen';
  final List<Meal> availableMeal;

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>?displayedMeal;
  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routArg['id'];
    categoryTitle= routArg['title'];
    displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }
  void deletedItem(String mealId)
  {
    setState(() {
      displayedMeal!.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: MealItem(
              imageUrl: displayedMeal![index].imageUrl,
              title: displayedMeal![index].title,
              complexity: displayedMeal![index].complexity,
              affordability: displayedMeal![index].affordability,
              duration:displayedMeal![index].duration,
              id: displayedMeal![index].id,
              // deletedItem: deletedItem,
            ),
          );
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}
