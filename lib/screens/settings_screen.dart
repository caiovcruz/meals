import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.onSettingsChanged,
    required this.settings,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _createSwitch(
                      'Gluten Free',
                      'Only displays gluten-free meals!',
                      settings.isGlutenFree,
                      (value) => setState(() {
                        settings.isGlutenFree = value;
                      }),
                    ),
                    _createSwitch(
                      'Lactose Free',
                      'Only displays lactose-free meals!',
                      settings.isLactoseFree,
                      (value) => setState(() {
                        settings.isLactoseFree = value;
                      }),
                    ),
                    _createSwitch(
                      'Vegan',
                      'Only displays vegan meals!',
                      settings.isVegan,
                      (value) => setState(() {
                        settings.isVegan = value;
                      }),
                    ),
                    _createSwitch(
                      'Vegetarian',
                      'Only displays vegatarian meals!',
                      settings.isVegetarian,
                      (value) => setState(() {
                        settings.isVegetarian = value;
                      }),
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
