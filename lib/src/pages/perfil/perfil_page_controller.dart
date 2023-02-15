import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//*Imagen del perfil del usuario
class PerilPageController extends ChangeNotifier {
  File? nuevaImagen;
  void actualizarImagen(String path) {
    this.nuevaImagen = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}
