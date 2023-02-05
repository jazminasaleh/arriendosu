import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//*Para distrubir la informacion
class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDr-SySwAGUap4T90lh_oEj3TYismqY6xs';

  Future<String?> createUser(String correo, String contrasena) async {
    final Map<String, dynamic> authData = {
      'correo': correo,
      'contrasena': contrasena
    };

    final url =
        Uri.http(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
  }
}
