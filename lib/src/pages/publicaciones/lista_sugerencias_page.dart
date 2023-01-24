import 'package:app_arriendosu/src/pages/publicaciones/lista_favoritos.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

class ListaSugerenciasPage extends StatelessWidget {
  final List lista;
  final String titulo;

  ListaSugerenciasPage({super.key, required this.lista, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          titulo,
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          Icon(
            Icons.view_agenda_outlined,
            color: utils.Colors.ocre,
            size: 35,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.view_module_sharp,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130,
                      width: 386,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: utils.Colors.azulOscuro,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset(
                              lista[index].iamgen,
                              width: 110,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lista[index].direccion,
                                  style: TextStyle(
                                      color: utils.Colors.blanco,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  lista[index].barrio,
                                  style: TextStyle(
                                      fontSize: 16, color: utils.Colors.blanco),
                                ),
                                Text(
                                  '\$${lista[index].precio}',
                                  style: TextStyle(
                                      color: utils.Colors.ocre,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
