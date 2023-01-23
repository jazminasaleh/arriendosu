import 'package:app_arriendosu/src/pages/publicaciones/lista_favoritos.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

class InicioPublicaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listaFavoritos = <ListaFavoritos>[
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 1',
          precio: '350.000',
          iamgen: 'assets/publicaciones/pub1.jpg'),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub2.jpg'),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub3.jpg'),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub4.jpg'),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub5.jpg')
    ];
    return Scaffold(
        backgroundColor: utils.Colors.fondoOscuro,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.home_work_rounded,
                    color: utils.Colors.ocre,
                    size: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Uhome',
                    style: TextStyle(
                        fontSize: 25,
                        color: utils.Colors.blanco,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: utils.Colors.blanco,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.bookmark_outline_rounded,
                    color: utils.Colors.blanco,
                    size: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 30, top: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Hola, jas',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  _buscador(),
                  _listaFavoritos(listaFavoritos: listaFavoritos),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 150,
                                width: 100,
                                color: Colors.green,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}

class _listaFavoritos extends StatelessWidget {
  const _listaFavoritos({
    required this.listaFavoritos,
  });
  
  final List<ListaFavoritos> listaFavoritos;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 370,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listaFavoritos.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 364,
                  width: 280,
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        opacity: 0.60,
                        image: AssetImage(listaFavoritos[index].iamgen),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, bottom: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          listaFavoritos[index].direccion,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: utils.Colors.blanco),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          listaFavoritos[index].barrio,
                          style: TextStyle(
                              fontSize: 15,
                              color: utils.Colors.blanco),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.euro_symbol_rounded,
                              color: utils.Colors.blanco,
                            ),
                            Text(
                              listaFavoritos[index].precio,
                              style: TextStyle(
                                  color: utils.Colors.blanco,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.bookmark_outline_rounded,
                              color: utils.Colors.blanco,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _buscador extends StatelessWidget {
  const _buscador({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
      ),
      child: GestureDetector(
        onTap: () {
          //*Parte del filtro
        },
        child: Container(
          height: 60,
          width: 385,
          decoration: BoxDecoration(
              color: utils.Colors.azulOscuro,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  size: 35,
                  color: utils.Colors.grisOscuro,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Buscar',
                  style: TextStyle(fontSize: 25, color: utils.Colors.grisClaro),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
