import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings? settings;
  final Function(Settings)? onSettingsChanged;

  const SettingsScreen({super.key, this.settings, this.onSettingsChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool?) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged!(settings!);
      },
      subtitle: Text(subtitle),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'No gluten',
                    'Only show meals without gluten',
                    settings!.isGlutenFree,
                    (value) =>
                        setState(() => settings!.isGlutenFree = value as bool),
                  ),
                  _createSwitch(
                    'No lactose',
                    'Only show meals without lactose',
                    settings!.isLactoseFree,
                    (value) =>
                        setState(() => settings!.isLactoseFree = value as bool),
                  ),
                  _createSwitch(
                    'Vegan',
                    'Only show vegan meals',
                    settings!.isVegan,
                    (value) =>
                        setState(() => settings!.isVegan = value as bool),
                  ),
                  _createSwitch(
                    'Vegetarian',
                    'Only show vegetarian meals',
                    settings!.isVegetarian,
                    (value) =>
                        setState(() => settings!.isVegetarian = value as bool),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
