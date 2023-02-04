import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDr-SySwAGUap4T90lh_oEj3TYismqY6xs';

  Future<String?> createUser(String usario, String contrasena) async {
    final Map<String, dynamic> authData = {
      'usuario': usario,
      'contrasena': contrasena
    };

    final url = Uri.http(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
  }
}
