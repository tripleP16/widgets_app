import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const WidgetsApp());
}

class WidgetsApp extends StatelessWidget {
  const WidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 10).getTheme(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('WidgetsApp'),
          ),
          body: const Center(
            child: Text('Hello, World!'),
          )),
    );
  }
}
