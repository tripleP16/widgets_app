import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subttitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subttitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subttitle: 'Varios botones',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subttitle: 'Contenedores estilizados',
      link: '/cards',
      icon: Icons.credit_card_outlined),
  MenuItem(
      title: 'Progress Indicators',
      subttitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars',
      subttitle: 'Snackbars y dialogs ',
      link: '/snackbars',
      icon: Icons.message_outlined),
  MenuItem(
      title: 'Animated',
      subttitle: 'Animated container',
      link: '/animated',
      icon: Icons.animation_rounded),
  MenuItem(
      title: 'Ui controls',
      subttitle: 'Controles de la ui',
      link: '/ui-controls',
      icon: Icons.keyboard_control_sharp),
  MenuItem(
      title: 'Introduccion de la app',
      subttitle: 'Tutorial',
      link: '/tutorial',
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: 'Infinite Scroll',
      subttitle: 'Infinite scroll',
      link: '/infinite-scroll',
      icon: Icons.list_alt_outlined)
];
