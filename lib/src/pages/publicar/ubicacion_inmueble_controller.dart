import 'package:flutter/cupertino.dart';

//*Guarda la ubicacion obtenida de pg ubicacion
class UbicacionInmuebleController extends ChangeNotifier{
  late BuildContext context;

  String ubicacionInmuebleController = '';
  String precioInmuebleController = '';
  String areaInmuebleController = '';
  String tipoInmuebleController = '';
  String habitacionesInmuebleController = '';
  String estratoInmuebleController = '';

  bool internetInmuebleController = false;
  bool serviciosInmuebleController = false;
  bool parqueaderoInmuebleController = false;
  bool mueblesInmuebleController = false;
  bool lavaderoInmuebleController = false;

 bool _isLoading = false;
  

  set carga(bool value) {
    _isLoading = value;
    
    String ubicacion = ubicacionInmuebleController;
    String precio = precioInmuebleController;
    String area = areaInmuebleController;
    String tipo = tipoInmuebleController;
    String habitaciones = habitacionesInmuebleController;
    String estrato = estratoInmuebleController;

    bool internt = internetInmuebleController;
    bool servicios = serviciosInmuebleController;
    bool parqueadero = parqueaderoInmuebleController;
    bool muebles = mueblesInmuebleController;
    bool lavadero = lavaderoInmuebleController;
    notifyListeners();
    print('ubicacion $ubicacion precio $precio tipo $tipo area $area habitaciones $habitaciones estrato $estrato internt$internt servicios $servicios parqueadero$parqueadero muebles $muebles lavadero$lavadero');
    
  }

 
}
