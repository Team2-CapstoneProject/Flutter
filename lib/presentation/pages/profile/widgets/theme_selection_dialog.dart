import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class ThemeSelectionDialog extends StatelessWidget {
  final BuildContext context;

  const ThemeSelectionDialog({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pilih Tema'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              _setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Text('Light'),
          ),
          ElevatedButton(
            onPressed: () {
              _setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Text('Dark'),
          ),
        ],
      ),
    );
  }

  Future<void> _setThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
    runApp(MyApp());
  }
}
