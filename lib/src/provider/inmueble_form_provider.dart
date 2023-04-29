import 'package:app_arriendosu/src/models/inmuebles.dart';
import 'package:flutter/cupertino.dart';

class InmuebleFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromKey = new GlobalKey<FormState>();

  Inmuebles inmueble;

  InmuebleFromProvider(this.inmueble);

  bool isValidForm() {
    return fromKey.currentState?.validate() ?? false;
  }
}
