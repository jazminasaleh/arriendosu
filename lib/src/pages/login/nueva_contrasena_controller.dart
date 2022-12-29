import 'package:flutter/material.dart';

class NuevaContrasenaController {
  late BuildContext context;

  TextEditingController codigoController = new TextEditingController();
  TextEditingController correoController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmarPasswordController =
      new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void login() {
    String codigo = codigoController.text;
    String password = passwordController.text;
    String confirmarPassword = confirmarPasswordController.text;
    String correo = correoController.text;
    print('$codigo $correo $password $confirmarPassword');
  }
}