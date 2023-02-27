import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificacionesService {
  static GlobalKey<ScaffoldMessengerState> mesnajeKey =
      new GlobalKey<ScaffoldMessengerState>();
  static showSnackbar(String mensaje) {
    final snackBar = new SnackBar(
        content: Text(
      mensaje,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ));

    mesnajeKey.currentState!.showSnackBar(snackBar);
  }
}
