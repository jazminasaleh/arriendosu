import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PerilPageController extends ChangeNotifier {
  File? nuevaImagen;
  void actualizarImagen(String path) {
    this.nuevaImagen = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}
