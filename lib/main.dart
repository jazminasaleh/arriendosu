
import 'package:app_arriendosu/src/pages/perfil/editar_perfil_page.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:app_arriendosu/src/pages/login/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Arriendos',
      initialRoute: 'home',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: utils.Colors.fondoOscuro),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: utils.Colors.ocre,
            ),
      ),
      routes: {
        'home': (BuildContext context) => Home_Page(),
        'inicio': (BuildContext context) => Inicio_Page(),
        'registro': (BuildContext context) => RegistroPage(),
        'olvidoContrasena': (BuildContext context) => OlvidarContrasenaPage(),
        'inicioPublicaciones': (BuildContext context) => InicioPublicaciones(),
        'editarperfil': (BuildContext context) => EditarPerfilPage()
      },
    );
  }
}
