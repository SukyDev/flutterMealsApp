import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Filters extends Equatable {
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegetarian;
  final bool vegan;

  const Filters({
    this.glutenFree = false,
    this.lactoseFree = false,
    this.vegetarian = false,
    this.vegan = false,
  });

  Filters copyWith({bool? glutenFree, bool? lactoseFree, bool? vegetarian,
  bool? vegan}) {
    return Filters(glutenFree: glutenFree ?? this.glutenFree,
    lactoseFree: lactoseFree ?? this.lactoseFree,
    vegetarian: vegetarian ?? this.vegetarian,
    vegan: vegan ?? this.vegan);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['glutenFree'] = glutenFree;
    data['lactoseFree'] = lactoseFree;
    data['vegetarian'] = vegetarian;
    data['vegan'] = vegan;
    return data;
  }

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
        glutenFree: json['glutenFree'],
        lactoseFree: json['lactoseFree'],
        vegetarian: json['vegetarian'],
        vegan: json['vegan']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [glutenFree, lactoseFree, vegetarian, vegan];
}