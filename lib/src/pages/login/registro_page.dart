import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../provider/login_form_provider.dart';

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

bool validacionUsser = false;
bool validEmail = false;
bool validacionPassword = false;
bool validacionConfPassword = false;
bool validacionPasswords = false;
int contador = 0;

class _formTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFromProvider>(context);
    return Form(
        key: loginForm.formKey,
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
            SizedBox(
              height: 10,
            ),
            validacionContrasenas(validacionPasswords),
            SizedBox(
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
                          print('valid$validEmail${loginForm.correo}');
                          contador++;
                        } else {
                          validEmail = true;
                          print('validconcorreo$validEmail${loginForm.correo}');
                          validacionCorreo(validEmail);
                        }
                        if (loginForm.contrasena != null &&
                            loginForm.contrasena.length >= 6) {
                          validacionPassword = false;
                          contador++;
                        } else {
                          validacionPassword = true;
                          validacionContrasena(validacionConfPassword);
                        }
                        if (loginForm.verificarContrasena != null &&
                            loginForm.verificarContrasena.length >= 6) {
                          validacionConfPassword = false;
                          contador++;
                        } else {
                          validacionConfPassword = true;

                          validacionContrasena(validacionConfPassword);
                        }
                        if (loginForm.contrasena ==
                            loginForm.verificarContrasena) {
                          contador++;
                          validacionPasswords = false;
                        } else {
                          validacionPasswords = true;
                        }
                        if (contador >= 5) {
                          validacionUsser = false;
                          validEmail = false;
                          validacionPassword = false;
                          validacionConfPassword = false;
                          validacionPasswords = false;
                          print('valid$validEmail');
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 1));
                          loginForm.isLoading = false;
                          Navigator.popAndPushNamed(context, 'inicio');
                        }
                        print('info${loginForm.isValidForm()}');
                      })
          ],
        ));
  }

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

  Widget validacionUsuario(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'El valor ingresado no luce como un usuario' : '',
            style: TextStyle(color: utils.Colors.rojo),
          ),
        ),
      ],
    ));
  }

  Widget validacionCorreo(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'El valor ingresado no luce como un correo' : '',
            style: TextStyle(color: utils.Colors.rojo),
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
          validacion ? 'La contraseña debe de ser de 6 caracteres' : '',
          style: TextStyle(color: utils.Colors.rojo),
        ),
      ],
    ));
  }

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
