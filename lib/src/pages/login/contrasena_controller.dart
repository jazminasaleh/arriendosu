import 'package:flutter/material.dart';

class ContrasenaController{
  late BuildContext context;

  TextEditingController correoController    = new TextEditingController();
 
  Future init(BuildContext context) async {
    this.context = context;
  }

  void login() {
    String email = correoController.text;
    
    print('$email');
  }
}