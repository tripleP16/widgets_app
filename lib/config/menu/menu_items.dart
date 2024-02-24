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
];
