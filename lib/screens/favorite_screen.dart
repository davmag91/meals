import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal>? favoriteMeals = [];

  FavoriteScreen({this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeals![index],
          );
        },
        itemCount: favoriteMeals!.length,
      );
    }

    return const Center(
      child: Text('No favorite meals found!'),
    );
  }
}
