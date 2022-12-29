import 'package:flutter/material.dart';

class ContrasenaController {
  late BuildContext context;
  TextEditingController correoController = new TextEditingController();

 

  Future init (BuildContext context, TextEditingController correo) async {
    this.context = await context;
  }

  String login() {
    String email = correoController.text;
    return email;
  }
}
