import 'package:flutter/cupertino.dart';

class PublicarProvider extends ChangeNotifier {
  final GlobalKey publicarKey = new GlobalKey();
  String ubicacion = ' ';
  String precio = ' ';
  String tipo = ' ';
  String area = ' ';
  String habitaciones = ' ';
  String estrato = ' ';
  bool internt = false,
      servicios = false,
      parqueadero = false,
      muebles = false,
      lavadero = false;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
