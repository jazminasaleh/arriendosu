import 'package:app_arriendosu/src/models/inmuebles.dart';
import 'package:app_arriendosu/src/pages/perfil/perfil.dart';

import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar1.dart';
import 'package:app_arriendosu/src/pages/ubicacion/pagina_ubicacion.dart';
import 'package:app_arriendosu/src/provider/login_form_provider.dart';
import 'package:app_arriendosu/src/provider/publicar_inmueble.dart';
import 'package:app_arriendosu/src/services/auth_service.dart';
import 'package:app_arriendosu/src/services/inmuebles_services.dart';
import 'package:app_arriendosu/src/services/notificaciones_services.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

//*estados de la aplicacion
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => LoginFromProvider()),
        ChangeNotifierProvider(create: (_) => PublicarProvider()),
        ChangeNotifierProvider(create: (_) => InmueblesServices())
      ],
      child: MyApp(),
    );
  }
}
//*La parte de las rutas de la aplicacion
//*que ruta inicia
//*tema
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
        'perfil': (BuildContext context) => PerfilPage(),
        'publicar1': (BuildContext context) => Publicar1Pagr(),
       
      },
      scaffoldMessengerKey: NotificacionesService.mesnajeKey,
    );
  }
}
