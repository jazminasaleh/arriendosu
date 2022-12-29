import 'package:app_arriendosu/src/pages/login/contrasena_page.dart';
import 'package:app_arriendosu/src/pages/login/nueva_contrasena_controller.dart';
import 'package:app_arriendosu/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NuevaContrasenaPage extends StatelessWidget {
  String correo;
  NuevaContrasenaPage({super.key, required this.correo});

  NuevaContrasenaController _contrasenaController =
      new NuevaContrasenaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.ocre,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          iconSize: 20,
          color: Colors.black,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'inicio');
              },
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nueva contraseña',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
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
                  color: utils.Colors.grisClaro,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: utils.Colors.grisMedio,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          children: [Text(correo)],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _formTextField(),
                    const SizedBox(
                      height: 80,
                    ),
                    ButtonApp(
                      onpress: _contrasenaController.login,
                      direccion: 'inicio',
                      texto: 'Iniciar',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _formTextField() {
    return Form(
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
                child: _textFieldCodigo(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldContrasena(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: _textFieldContrasena2(),
              ),
            ),
          ],
        ));
  }

  TextFormField _textFieldCodigo() {
    return TextFormField(
      controller: _contrasenaController.codigoController,
      autocorrect: false,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Codigo verificacion',
          prefixIcon: Icon(
            Icons.password,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: Color(0xff3A4750),
    );
  }

  TextFormField _textFieldContrasena() {
    return TextFormField(
      controller: _contrasenaController.passwordController,
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
    );
  }

  TextFormField _textFieldContrasena2() {
    return TextFormField(
      controller: _contrasenaController.confirmarPasswordController,
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
    );
  }
}
