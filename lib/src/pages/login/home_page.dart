import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:flutter_svg/flutter_svg.dart';

//*Pagina principal de bienvenida
class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
         SvgPicture.asset( 'assets/registro/Logo.svg'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 100,
            decoration: const BoxDecoration(
                color: utils.Colors.azulOscuro,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bienvenido',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: utils.Colors.blanco),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'App para todos los miembros que pertenezcan a la UPTC y deseen encontrar un inmueble en arriendo de forma rápida.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.Colors.blanco),textAlign: TextAlign.justify,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _button(utils.Colors.ocre, 'Iniciar', Colors.white, context),
                      _button(Colors.white, 'Registrarse', Colors.black, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//*Boton tanto de inicio como de registro
  Widget _button(Color colorfondo, String texto, Color colorTexto, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (texto == 'Iniciar') {
          Navigator.popAndPushNamed(context, 'inicio');
        } else {
          Navigator.popAndPushNamed(context, 'registro');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorfondo, borderRadius: BorderRadius.circular(30)),
        width: 160,
        height: 60,
        child: Center(
          child: Text(
            texto,
            style: TextStyle(
                color: colorTexto, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
