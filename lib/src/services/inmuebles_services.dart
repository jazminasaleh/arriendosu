import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/inmuebles.dart';
import 'package:http/http.dart' as http;

class InmueblesServices extends ChangeNotifier {
  final String _baseUrl = 'app-arriendos-default-rtdb.firebaseio.com';
  final List<Inmuebles> inmuebles = [];
  bool isLoading = true;

  InmueblesServices() {
    this.LoadProducts();
  }

  Future<List<Inmuebles>> LoadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'Inmuebles.json');
    final resp = await http.get(url);
    final Map<String, dynamic> inmueblesMap = json.decode(resp.body);

    inmueblesMap.forEach((key, value) {
      final inmuebleTemporal = Inmuebles.fromMap(value);
      inmuebleTemporal.id = key;
      this.inmuebles.add(inmuebleTemporal);
    });

    this.isLoading = false;
    notifyListeners();

    return this.inmuebles;
  }
}
