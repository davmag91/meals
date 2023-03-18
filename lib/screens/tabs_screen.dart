import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/favorite_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal>? favoriteMeals = [];

  TabsScreen({this.favoriteMeals, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [
      {'title': 'Categories', 'screen': const CategoriesScreen()},
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    _screens = [
      {'title': 'Categories', 'screen': const CategoriesScreen()},
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      },
    ];

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens![_selectedScreenIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _screens![_selectedScreenIndex]['screen'] as Widget?,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => setState(() {
            _selectedScreenIndex = value;
          }),
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            )
          ],
        ),
      ),
    );
  }
}
