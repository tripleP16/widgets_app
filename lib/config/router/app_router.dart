import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ButtonsScreen()),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      pageBuilder: (context, state) => const MaterialPage(child: CardsScreen()),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SnackbarScreen()),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: AnimatedScreen()),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: UiControlsScreen()),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: AppTutorialScreen()),
    ),
    GoRoute(
      path: '/infinite-scroll',
      name: InfiniteScrollScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: InfiniteScrollScreen()),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ProgressScreen()),
    ),
    GoRoute(
      path: '/counter',
      name: CounterScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: CounterScreen()),
    ),
    GoRoute(
      path: '/change_theme',
      name: ChangeThemeScreen.name,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ChangeThemeScreen()),
    ),
  ],
);
