import 'package:flutter/material.dart';

class ChangeThemeScreen extends StatelessWidget {
  static const name = 'change_theme';
  const ChangeThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
      ),
      body: const Placeholder(),
    );
  }
}
