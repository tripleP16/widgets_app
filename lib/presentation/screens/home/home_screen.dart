import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Flutter + Material 3',
        ),
      ),
      body: const _HomeLayout(),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _HomeLayout extends StatelessWidget {
  const _HomeLayout();

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
        context.push(item.link);
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
