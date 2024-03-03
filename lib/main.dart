import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: WidgetsApp()));
}

class WidgetsApp extends ConsumerWidget {
  const WidgetsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
    );
  }
}
