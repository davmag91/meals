import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s Cook'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 120,
        ),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            category: category,
          );
        }).toList(),
      ),
    );
  }
}
