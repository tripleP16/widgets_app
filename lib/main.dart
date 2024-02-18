import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetsApp());
}

class WidgetsApp extends StatelessWidget {
  const WidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
