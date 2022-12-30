import 'package:app_arriendosu/src/pages/login/inicio_page.dart';
import 'package:app_arriendosu/src/pages/publicaciones/menu/menu_pagina.dart';
import 'package:app_arriendosu/src/pages/publicaciones/menu/opciones_menu.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FiltrarOrdenarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuPrincipal(),
      body: Container(
        width: MediaQuery.of(context).size.width*100,
        decoration: BoxDecoration(
          color: utils.Colors.ocre
        ),
        child: Column(
          children: [
           Expanded(
             child: Container(
                  decoration: const BoxDecoration(
                    color: utils.Colors.grisClaro,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  )
             ),
           )
            ],
        ),
      ),
    );
  }
}
