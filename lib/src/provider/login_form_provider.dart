import 'package:flutter/cupertino.dart';

//*El estado del fromulario del login
//*La infromacion del formualrio
class LoginFromProvider extends ChangeNotifier {
  //*final GlobalKey<FormState> formKeyInicio = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKeRegistro = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKecontrasena = new GlobalKey<FormState>();

   /*final formKeyInicio = const Key('__RIKEY1__');
  final formKeRegistro = const Key('__RIKEY2__');
  final formKecontrasena = const Key('__RIKEY3__');*/
  String correo = ' ';
  String corroOlvido = ' ';
  String contrasena = ' ';
  String verificarContrasena = ' ';
  String nomUusario = ' ';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /*bool isValidFormInicio() {
    print('$nomUusario $correo $contrasena $verificarContrasena $corroOlvido');
    print('se esta validadndo${formKeyInicio.currentState?.validate()}');
    return formKeyInicio.currentState?.validate() ?? false;
  }*/
}
