import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageOpcionesMenu = <OpcionesMenu>[
  OpcionesMenu(icon: FontAwesomeIcons.heart, titulo: 'Favoritos', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.gear, titulo: 'Preferncias', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.mapLocation, titulo: 'Ubicación', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.squarePlus, titulo: 'Publicar', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.houseChimney, titulo: 'Publicaciones', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.user, titulo: 'Cuenta', page: Inicio_Page()),
  OpcionesMenu(icon: FontAwesomeIcons.house, titulo: 'Inicio', page: Inicio_Page())
  

];

class OpcionesMenu {
  final IconData icon;
  final String titulo;
  final Widget page;

  OpcionesMenu({required this.icon, required this.titulo, required this.page});
}
