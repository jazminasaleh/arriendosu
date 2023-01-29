import 'package:flutter/cupertino.dart';

//*Dtaos de usuario obtenidos a la hora de editar el perfil
class EditarPerfilController {
  late BuildContext context;

  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController correoController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void datosUsuario() {
    String nombre = nombreController.text;
    String apellido = apellidoController.text;
    String correo = correoController.text;
    String telefono = telefonoController.text;
  }
}
