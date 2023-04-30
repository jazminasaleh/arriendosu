import 'package:flutter/cupertino.dart';

class PublicarProvider extends ChangeNotifier {
  final GlobalKey publicarKey = new GlobalKey();
  String ubicacion = ' ';
  String precio = ' ';
  String tipo = ' ';
  String area = ' ';
  String habitaciones = ' ';
  String estrato = ' ';
  String nombre = ' ';
  String descripcion = ' ';
  bool internt = false,
      servicios = false,
      parqueadero = false,
      muebles = false,
      lavadero = false;
  bool mascotas = false, fumar = false, telegram = false, whatsaap= false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    print('nombre $nombre internt $internt  ubicacion $ubicacion precio $precio tipo $tipo habitaciones $habitaciones descripcion $descripcion');
    notifyListeners();
  }
}
