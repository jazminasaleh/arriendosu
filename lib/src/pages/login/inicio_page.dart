import 'package:app_arriendosu/src/provider/login_form_provider.dart';
import 'package:app_arriendosu/src/services/notificaciones_services.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;

import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

//*Pagina para iniciar sesion
class Inicio_Page extends StatefulWidget {
  @override
  State<Inicio_Page> createState() => _Inicio_PageState();
}

class _Inicio_PageState extends State<Inicio_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'registro');
              },
              child: const Text(
                'Registrar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: utils.Colors.blanco),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            //*Quitar el teclado
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Iniciar',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: utils.Colors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 700,
                decoration: const BoxDecoration(
                  color: utils.Colors.azulOscuro,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFromProvider(),
                      child: _formTextField(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _buttonConectar(
                        'Continuar con google', 'assets/registro/google.png'),
                    const SizedBox(
                      height: 15,
                    ),
                    _buttonConectar(
                        'Continuar con facebook', 'assets/registro/face.png')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//*Formulario donde:
//*Campo para ingresar el nombre de usuario
//*Campo para ingresar la contraseña
//*Vlidacion de fromulario
  bool validacionEmail = false;
  bool validacionContrasegna = false;
  int contador = 0;
  static GlobalKey<FormState> formKeyInicio = new GlobalKey<FormState>();
  Widget _formTextField() {
    final loginForm = Provider.of<LoginFromProvider>(context);

    return Form(
        key: formKeyInicio,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldUsuario(loginForm),
              ),
            ),
            validacionCorreo(validacionEmail),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldContrasena(loginForm),
              ),
            ),
            validacionContrasena(validacionContrasegna),
            _textContrasena(),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                disabledColor: utils.Colors.grisOscuro,
                elevation: 0,
                color: utils.Colors.ocre,
                height: 60,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                      textAlign: TextAlign.center,
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        contador = 0;
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        String patternContrasena =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExpContrasena = new RegExp(patternContrasena);
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if (regExp.hasMatch(loginForm.correo ?? '') &&
                            loginForm.correo != '') {
                          validacionEmail = false;
                          contador++;
                        } else {
                          validacionEmail = true;
                          validacionCorreo(validacionEmail);
                        }
                        if (regExpContrasena.hasMatch(loginForm.contrasena ?? '') &&
                            loginForm.contrasena != '') {
                          validacionContrasegna = false;
                          contador++;
                        } else {
                          validacionContrasegna = true;
                          validacionContrasena(validacionContrasegna);
                        }
                        if (contador >= 2) {
                          loginForm.isLoading = true;
                          final String? errorMessage = await authService.login(
                              loginForm.correo, loginForm.contrasena);
                          if (errorMessage == null) {
                            loginForm.contrasena = '';
                            loginForm.correo =  '';
                            Navigator.popAndPushNamed(
                                context, 'inicioPublicaciones');
                            loginForm.isLoading = false;
                          } else {
                            NotificacionesService.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                        }
                      })
          ],
        ));
  }

//*Campo para llenar el correo
//*Y hacer la validacion del correo
  TextFormField _textFieldUsuario(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Correo electronico',
          labelText: 'Correo',
          prefixIcon: Icon(
            Icons.email,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: const Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.correo = value,
    );
  }

//*Campo para llenar la contraseña
  TextFormField _textFieldContrasena(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '******',
          labelText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            size: 35,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: const Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.contrasena = value,
    );
  }

//*TextButton si la persona olvido su contraseña
  Widget _textContrasena() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'olvidoContrasena');
              },
              child: const Text(
                '¿Olvido su contraseña?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: utils.Colors.grisClaro,
                ),
              )),
        ],
      ),
    );
  }

//*Ingresar con una cuneta de google o facebook
  Widget _buttonConectar(String texto, String linkImge) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(0, 2),
              )
            ]),
        height: 64,
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(linkImge),
              backgroundColor: Colors.white,
            ),
            Text(
              texto,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ),
    );
  }

  Widget validacionCorreo(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'Ese correo no funionó' : '',
            style: const TextStyle(color: utils.Colors.rojo),
          ),
        ),
      ],
    ));
  }

  Widget validacionContrasena(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'Esa contraseña no funcionó' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }
}
