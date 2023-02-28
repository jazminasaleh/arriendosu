import 'package:app_arriendosu/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../provider/login_form_provider.dart';
import '../../services/notificaciones_services.dart';

//*Pagina para hacer el registro en la app
class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'inicio');
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'inicio');
              },
              child: const Text(
                'Iniciar',
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
                        'Registrarse',
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
                      height: 80,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFromProvider(),
                      child: _formTextField(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//*Campos como el correo, usuario, contraseña
//*validacion del formulario
bool validacionUsser = false;
bool validEmail = false;
bool validacionPassword = false;
bool validacionConfPassword = false;
bool validacionPasswords = false;
int contador = 0;

class _formTextField extends StatelessWidget {
  static final formKeRegistro = const Key('__RIKEY2__');
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFromProvider>(context);
    return Form(
        key: formKeRegistro,
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
            validacionUsuario(validacionUsser),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFielCorreo(loginForm),
              ),
            ),
            validacionCorreo(validEmail),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldContrasena(loginForm),
              ),
            ),
            validacionContrasena(validacionPassword),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldContrasena2(loginForm),
              ),
            ),
            validacionConfContrasena(validacionConfPassword),
            const SizedBox(
              height: 10,
            ),
            validacionContrasenas(validacionPasswords),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                disabledColor: utils.Colors.grisOscuro,
                elevation: 0,
                color: utils.Colors.ocre,
                height: 64,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Registrarse',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        contador = 0;
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        String  patternContrasena = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExpContrasena = new RegExp(patternContrasena);
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if (loginForm.nomUusario != null &&
                            loginForm.nomUusario.length >= 3) {
                          validacionUsser = false;
                          contador++;
                        } else {
                          validacionUsser = true;
                          validacionUsuario(validacionUsser);
                        }
                        if (regExp.hasMatch(loginForm.correo ?? '') &&
                            loginForm.correo != '') {
                          validEmail = false;
                          contador++;
                        } else {
                          validEmail = true;
                          validacionCorreo(validEmail);
                        }
                         if (regExpContrasena.hasMatch(loginForm.contrasena ?? '') && loginForm.contrasena != '') {
                          validacionPassword = false;
                          contador++;
                        } else {
                          validacionPassword = true;
                          validacionContrasena(validacionPassword);
                        }
                         if (regExpContrasena.hasMatch(loginForm.verificarContrasena ?? '') && loginForm.verificarContrasena != '') {
                           validacionConfPassword = false;
                          contador++;
                        } else {
                           validacionConfPassword = true;
                          validacionContrasena( validacionConfPassword);
                        }
                        if (loginForm.contrasena ==
                            loginForm.verificarContrasena) {
                          contador++;
                          validacionPasswords = false;
                        } else {
                          validacionPasswords = true;
                        }
                       
                        if (contador >= 5) {
                          loginForm.isLoading = true;
                          final String? errorMessage =
                              await authService.createUser(
                                  loginForm.correo, loginForm.contrasena);
                          if (errorMessage == null) {
                            Navigator.popAndPushNamed(context, 'inicio');
                          } else {
                            //*Notifiar que hay algo mal
                             NotificacionesService.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                          loginForm.isLoading = false;
                        }
                      })
          ],
        ));
  }

//*Campo para confrimar la contraseña
  TextFormField _textFieldContrasena2(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Confirmar Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 15,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.verificarContrasena = value,
    );
  }

//*campo para digitar nombre del usuario
  TextFormField _textFieldUsuario(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Nombre de usuario',
          labelText: 'Usuario',
          prefixIcon: Icon(
            Icons.person,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.nomUusario = value,
    );
  }

//*campo para digitar el correo
  TextFormField _textFielCorreo(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
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
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.correo = value,
    );
  }

//*campo para digitar la contraseña
  TextFormField _textFieldContrasena(LoginFromProvider loginFromProvider) {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 15,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => loginFromProvider.contrasena = value,
    );
  }

//*texto de validacion de usuario
  Widget validacionUsuario(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'El valor ingresado no luce como un usuario' : '',
            style: const TextStyle(color: utils.Colors.rojo),
          ),
        ),
      ],
    ));
  }

//*Texto de validacion de correo
  Widget validacionCorreo(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'El valor ingresado no luce como un correo' : '',
            style: const TextStyle(color: utils.Colors.rojo),
          ),
        ),
      ],
    ));
  }

//*Texto de validacion de ka contraseña
  Widget validacionContrasena(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'La contraseña debe de ser de 6 caracteres' : '',
          style: const TextStyle(color: utils.Colors.rojo),
        ),
      ],
    ));
  }

//*Texto de validacion de contraseña confirmada
  Widget validacionConfContrasena(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'La contraseña debe de ser de 6 caracteres' : '',
          style: TextStyle(color: utils.Colors.rojo),
        ),
      ],
    ));
  }

//*Texto para ver si las dos contraseñas digitadas son iguales
  Widget validacionContrasenas(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'Las dos contraseñas no coindicen' : '',
          style: TextStyle(color: utils.Colors.rojo),
        ),
      ],
    ));
  }
}
