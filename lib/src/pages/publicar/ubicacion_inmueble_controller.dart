import 'package:flutter/cupertino.dart';
//*Guarda la ubicacion obtenida de pg ubicacion
class UbicacionInmuebleController {
  late BuildContext context;

  TextEditingController ubicacionInmuebleController = new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void ubicacion() {
    String ubicacion = ubicacionInmuebleController.text;
  }
}