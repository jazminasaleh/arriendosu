import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
class GaleriaImagenes extends StatelessWidget {
  const GaleriaImagenes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        title: Text('Galeria'),
      ),
    );
  }
}
