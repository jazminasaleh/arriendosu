//*Inmuebles que fueron guardados
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*Informacion de los inmuebles que fueron guardados por el usuario
class ListaFavoritos {
 
  final String iamgen;
  List<Widget> imagenes;

  ListaFavoritos(
      {required this.iamgen,
      required this.imagenes,
      });
}

//*lista de las publicaciones favoritas
class ListaLlenaFavoritos {
  final listaFavoritos = <ListaFavoritos>[
    ListaFavoritos(
         iamgen: 'assets/publicaciones/Pub11.png', 
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub11.png')), Image(image:  AssetImage('assets/publicaciones/Pub12.png')), Image(image:  AssetImage('assets/publicaciones/Pub13.png')),],
      ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/Pub21.png',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub21.png')), Image(image:  AssetImage('assets/publicaciones/Pub22.png')), Image(image:  AssetImage('assets/publicaciones/Pub23.png')),],
       ),
        
    ListaFavoritos(
         iamgen: 'assets/publicaciones/Pub31.png',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub31.png')), Image(image:  AssetImage('assets/publicaciones/Pub32.png')), Image(image:  AssetImage('assets/publicaciones/Pub33.png')), Image(image:  AssetImage('assets/publicaciones/Pub34.png')),Image(image:  AssetImage('assets/publicaciones/Pub35.png')),Image(image:  AssetImage('assets/publicaciones/Pub36.png'))],
       ),
    ListaFavoritos(
         iamgen: 'assets/publicaciones/Pub41.png',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub41.png')), Image(image:  AssetImage('assets/publicaciones/Pub42.png')), Image(image:  AssetImage('assets/publicaciones/Pub43.png')), Image(image:  AssetImage('assets/publicaciones/Pub44.png')),],
      ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/Pub51.png',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub51.png')), Image(image:  AssetImage('assets/publicaciones/pub52.png')), Image(image:  AssetImage('assets/publicaciones/Pub53.png')), Image(image:  AssetImage('assets/publicaciones/Pub54.png')),],
      ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/Pub61.png',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/Pub61.png')), Image(image:  AssetImage('assets/publicaciones/pub62.png')), Image(image:  AssetImage('assets/publicaciones/Pub63.png')), Image(image:  AssetImage('assets/publicaciones/Pub64.png')),],
      ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/pub2.jpg',
        imagenes: [
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
        ],
       ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/pub3.jpg',
        imagenes: [
          Image(image: AssetImage('assets/publicaciones/pub3.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
        ],
       ),
    ListaFavoritos(
        iamgen: 'assets/publicaciones/pub5.jpg',
        imagenes: [
          Image(image: AssetImage('assets/publicaciones/pub5.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
          Image(image: AssetImage('assets/publicaciones/pub2.jpg')),
        ],
    ),
  ];
}
