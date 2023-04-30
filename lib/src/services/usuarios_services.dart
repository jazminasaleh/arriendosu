import 'dart:convert';
import 'dart:io';

import 'package:app_arriendosu/src/models/usuarios.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//*obtener la inromacion de la base de datos de los usuarios
class UsuariosServices extends ChangeNotifier {
  final String _baseUrl = 'app-arriendos-default-rtdb.firebaseio.com';
  final List<Usuarios> usuarios = [];
  late Usuarios selectUusario;
  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  UsuariosServices() {
    this.LoadProducts();
  }

  Future<List<Usuarios>> LoadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    final resp = await http.get(url);
    final Map<String, dynamic> usuariosMap = json.decode(resp.body);
    this.isLoading = false;
    usuariosMap.forEach((key, value) {
      final usuariosTemporal = Usuarios.fromMap(value);
      usuariosTemporal.id = key;
      this.usuarios.add(usuariosTemporal);
    });

    this.isLoading = false;
    notifyListeners();

    return this.usuarios;
  }

  Future guardarOCrearUsuarios(Usuarios usuario) async {
    isSaving = true;
    notifyListeners();

    if (usuario.id == null) {
      //*Se crea un producto
      await this.createUsuario(usuario);
    } else {
      await this.updateUsuario(usuario);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateUsuario(Usuarios usuario) async {
    final url = Uri.https(_baseUrl, 'Usuarios/${usuario.id}.json');
    final resp = await http.put(url, body: usuario.toJson());
    final decodeData = resp.body;

    print('Informacion de los usuarios$decodeData');
    final index =
        this.usuarios.indexWhere((element) => element.id == usuario.id);
    this.usuarios[index] = usuario;

    return usuario.id.toString();
  }

  Future<String> createUsuario(Usuarios usuario) async {
    final url = Uri.https(_baseUrl, 'Usuarios.json');
    final resp = await http.post(url, body: usuario.toJson());
    final decodeData = json.decode(resp.body);

    usuario.id = decodeData['name'];
    this.usuarios.add(usuario);

    return usuario.id.toString();
  }

  void updateSelectUserImage(String path) {
    this.selectUusario.foto = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
    uploadImage();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dbzsnembj/image/upload?upload_preset=foqpn6y9');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    print(resp.body);
  }
}
