import 'package:flutter/cupertino.dart';
//*El estado del fromulario del login
//*La infromacion del formualrio
class LoginFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String correo = ' ';
  String contrasena = ' ';
  String verificarContrasena = ' ';
  String nomUusario = ' ';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$nomUusario $correo $contrasena $verificarContrasena');
    print('se esta validadndo${formKey.currentState?.validate()}');
    return formKey.currentState?.validate() ?? false;
  }
}
