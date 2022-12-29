import 'package:flutter/material.dart';

class RegistroController {
  late BuildContext context;

  TextEditingController usuarioController = new TextEditingController();
  TextEditingController correoController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmarPasswordController =
      new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void login() {
    String usuario = usuarioController.text;
    String password = passwordController.text;
    String confirmarPassword = confirmarPasswordController.text;
    String correo = correoController.text;
    print('$usuario $correo $password $confirmarPassword');
  }
}
