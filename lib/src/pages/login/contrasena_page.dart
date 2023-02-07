import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;


import '../../widgets/button.dart';

class OlvidarContrasenaPage extends StatelessWidget {
  ContrasenaController contrasenaController = new ContrasenaController();

  @override
  Widget build(BuildContext context) {
    contrasenaController.init(context, contrasenaController.correoController);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'inicio');
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '¿Olvido su contraseña?',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: utils.Colors.blanco
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
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
                    const Padding(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500, color: utils.Colors.blanco),
                      ),
                    ),
                    _fromTextField(),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NuevaContrasenaPage(correo: contrasenaController.correoController.text)
                    )
           );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: utils.Colors.ocre,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        height: 64,
                        width: 340,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text(
                              'Enviar',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _fromTextField() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: utils.Colors.grisMedio,
                borderRadius: BorderRadius.circular(35),
              ),
              child: _textFielCorreo(),
            ),
          ),
        ]));
  }

  TextFormField _textFielCorreo() {
    return TextFormField(
      controller: contrasenaController.correoController,
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
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : 'El valor ingresado no luce como un correo';
      },
    );
  }
}
