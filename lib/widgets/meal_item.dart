import 'package:flutter/material.dart';
import 'package:multi_screen_app_bloc/models/meal.dart';
import 'package:multi_screen_app_bloc/screens/meal_details.dart';
import 'package:multi_screen_app_bloc/widgets/meal_item_trait.dart';
// 17.01. dodat novi paket
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectMeal});

final Meal meal;
final void Function(Meal meal) selectMeal;

// 18.01. fun fact - nema capitalized metoda u flutter-u
String get complexityString {
  return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
}

String get affordabilityText {
  return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
}

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {
            selectMeal(meal);
          },
          //17.01. u Flutter-u stack znaci jedan preko drugog view-a
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              // 17.01. widget za pozicioniranje
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title, maxLines: 2, textAlign: TextAlign.center,
                        softWrap: true,
                        // Overflow koristimo za dugi tekst, ellipsis dodaje ... na kraj
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min',
                          ),
                          const SizedBox(width: 7,),
                          MealItemTrait(icon: Icons.work, label: complexityString),
                          const SizedBox(width: 7,),
                          MealItemTrait(icon: Icons.money, label: affordabilityText),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
