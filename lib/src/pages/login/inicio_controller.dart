import 'package:flutter/material.dart';

class InicialController{
  late BuildContext context;

  TextEditingController usuarioController    = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void login() {
    String email = usuarioController.text;
    String password = passwordController.text;
    print('$email $password');
  }
}