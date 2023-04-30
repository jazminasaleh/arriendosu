import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/inmuebles.dart';
import 'package:http/http.dart' as http;

class InmueblesServices extends ChangeNotifier {
  final String _baseUrl = 'app-arriendos-default-rtdb.firebaseio.com';
  final List<Inmuebles> inmuebles = [];
  bool isLoading = true;
  bool isSaving = false;

  InmueblesServices() {
    this.LoadProducts();
  }

  Future<List<Inmuebles>> LoadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'Inmuebles.json');
    print('final url $url');
    final resp = await http.get(url);
    final Map<String, dynamic> inmueblesMap = json.decode(resp.body);

    inmueblesMap.forEach((key, value) {
       print('El valor que llega $value');
      final inmuebleTemporal = Inmuebles.fromMap(value);
      print('Infomrcaion inmueble temporal que llega ${inmuebleTemporal}');
      inmuebleTemporal.id = key;
      this.inmuebles.add(inmuebleTemporal);
      print('Infomrcaion inmueble que llega ${inmuebles}');
    });

    this.isLoading = false;
    notifyListeners();

    return this.inmuebles;
  }

  Future guardarOCrearInmueble(Inmuebles inmueble) async {
    isSaving = true;
    notifyListeners();

    if (inmueble.id == null) {
      //*Se crea un producto
      await this.createProdcut(inmueble);
    } else {
      await this.updateProdcut(inmueble);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProdcut(Inmuebles inmueble) async {
    final url = Uri.https(_baseUrl, 'Inmuebles/${inmueble.id}.json');
    final resp = await http.put(url, body: inmueble.toJson());
    final decodeData = resp.body;

    print(decodeData);
    final index =
        this.inmuebles.indexWhere((element) => element.id == inmueble.id);
    this.inmuebles[index] = inmueble;

    return inmueble.id.toString();
  }

  Future<String> createProdcut(Inmuebles inmueble) async {
    final url = Uri.https(_baseUrl, 'Inmuebles.json');
    final resp = await http.post(url, body: inmueble.toJson());
    final decodeData = json.decode(resp.body);

    inmueble.id = decodeData['name'];
    this.inmuebles.add(inmueble);

    return inmueble.id.toString();
  }
}
