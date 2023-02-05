import 'package:app_arriendosu/src/pages/perfil/perfil.dart';

import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/pages/ubicacion/pagina_ubicacion.dart';
import 'package:app_arriendosu/src/provider/login_form_provider.dart';
import 'package:app_arriendosu/src/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginFromProvider()),
      ChangeNotifierProvider(create: (_) => AuthService()),
      
    ],
    child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Arriendos',
      initialRoute: 'home',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: utils.Colors.fondoOscuro),
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
        'editarperfil': (BuildContext context) => EditarPerfilPage(),
        'ubicacion': (BuildContext context) => UbicacionPage(),
        'perfil': (BuildContext context) => PerfilPage()
      },
    );
  }
}
