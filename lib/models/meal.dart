import 'dart:convert';

import 'package:equatable/equatable.dart';

enum Complexity {
  simple,
  challenging,
  hard;
  
  String toJson() => name;
  static Complexity fromJson(String json) => values.byName(json);
}

enum Affordability {
  affordable,
  pricey,
  luxurious;
  
  String toJson() => name;
  static Affordability fromJson(String json) => values.byName(json);
}

class Meal extends Equatable {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categories'] = categories;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['duration'] = duration;
    data['complexity'] = complexity.toJson();
    data['affordability'] = affordability.toJson();
    data['isGlutenFree'] = isGlutenFree;
    data['isLactoseFree'] = isLactoseFree;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    return data;
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(id: json['id'],
        categories: json['categories'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        ingredients: json['ingredients'],
        steps: json['steps'],
        duration: json['duration'],
        complexity: Complexity.fromJson(json['complexity']),
        affordability: Affordability.fromJson(json['affordability']),
        isGlutenFree: json['isGlutenFree'],
        isLactoseFree: json['isLactoseFree'],
        isVegan: json['isVegan'],
        isVegetarian: json['isVegetarian']);
  }

  @override
  List<Object?> get props =>
      [
        id,
        categories,
        title,
        imageUrl,
        ingredients,
        steps,
        duration,
        complexity,
        affordability,
        isGlutenFree,
        isLactoseFree,
        isVegan,
        isVegetarian
      ];
}
