import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/buttons',
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtonsScreen()),
    ),
    GoRoute(
      path: '/cards',
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtonsScreen()),
    ),
  ],
);
