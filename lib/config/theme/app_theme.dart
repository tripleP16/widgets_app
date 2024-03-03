import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lime,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepOrange,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode);
  }
}
