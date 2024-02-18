import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter + Material 3',
        ),
      ),
      body: const _HomeLayput(),
    );
  }
}

class _HomeLayput extends StatelessWidget {
  const _HomeLayput();

  @override
  Widget build(BuildContext context) {
    const menuItems = appMenuItems;
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _HomeItemView(item: item);
        },
        itemCount: menuItems.length);
  }
}

class _HomeItemView extends StatelessWidget {
  const _HomeItemView({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.subttitle),
      trailing: Icon(
        Icons.chevron_right,
        color: colors.primary,
      ),
      leading: Icon(
        item.icon,
        color: colors.primary,
      ),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        Navigator.of(context).pushNamed(item.link);
      },
    );
  }
}
