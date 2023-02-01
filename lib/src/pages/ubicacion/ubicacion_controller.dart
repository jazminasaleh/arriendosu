import 'package:flutter/cupertino.dart';

class UbicacionController {
  late BuildContext context;

  TextEditingController ubicacionController = new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void ubicacion() {
    String ubicacion = ubicacionController.text;
    print('$ubicacion');
  }
}
