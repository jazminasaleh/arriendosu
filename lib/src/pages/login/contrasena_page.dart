import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../provider/login_form_provider.dart';


//*pagina de si la persona olvido su contraseña
class OlvidarContrasenaPage extends StatelessWidget {
  ContrasenaController contrasenaController = new ContrasenaController();
  bool validacionEmail = false;
  static final formKecontrasena = const Key('__RIKEY3__');
  @override
  Widget build(BuildContext context) {
    contrasenaController.init(context, contrasenaController.correoController);
    final loginForm = Provider.of<LoginFromProvider>(context);
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
                            color: utils.Colors.blanco),
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
                        'Si ha olvidado su contraseña, por favor ingrese su correo electrónico, y ahí le llegará un código de verificación, y en la siguiente pantalla podrá ingresar ese código y asignar una nueva contraseña.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: utils.Colors.blanco),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Form(
                        key: formKecontrasena,
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
                              child: TextFormField(
                                controller:
                                    contrasenaController.correoController,
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
                                cursorColor: const Color(0xff3A4750),
                                onChanged: (value) => loginForm.correoOlvido = value,
                                /*validator: (value) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  return regExp.hasMatch(value ?? '')
                                      ? null
                                      : 'El valor ingresado no luce como un correo';
                                },*/
                              ),
                            ),
                          ),
                        ])),
                    validacionCorreoOlvidado(validacionEmail),
                    const SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        disabledColor: utils.Colors.grisOscuro,
                        elevation: 0,
                        color: utils.Colors.ocre,
                        height: 60,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            child: Text(
                              loginForm.isLoading ? 'Espere' : 'Enviar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            )),
                        onPressed: loginForm.isLoading
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();
                                String pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regExp = new RegExp(pattern);
                                if (regExp.hasMatch(loginForm.correoOlvido ?? '') &&
                                    loginForm.correoOlvido != '') {
                                    validacionEmail = false;
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NuevaContrasenaPage(correo: loginForm.correoOlvido)),
                                  );
                                } else {
                                  validacionEmail = true;
                                }
                              })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget validacionCorreoOlvidado(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            validacion ? 'El valor ingresado no luce como un correo' : '',
            style: const TextStyle(color: utils.Colors.rojo),
          ),
        ),
      ],
    ));
  }
}
