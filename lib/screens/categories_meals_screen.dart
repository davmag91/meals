import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category? category;

  const CategoriesMealsScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
      ),
      body: Center(
        child: Text('Recipes by Category id ${category!.id}'),
      ),
    );
  }
}
