import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/screens/favorite_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    const {'title': 'Categories', 'screen': CategoriesScreen()},
    const {'title': 'Favorites', 'screen': FavoriteScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title'] as String),
        ),
        body: _screens[_selectedScreenIndex]['screen'] as Widget?,
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
