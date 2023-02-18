
//*Inmuebles que fueron guardados
import 'package:flutter/cupertino.dart';

class ListaFavoritos {
  final String direccion;
  final String barrio;
  final String precio;
  final String iamgen;
  List <Widget> imagenes;
  ListaFavoritos({ required this.direccion,  required this.barrio,  required this.precio,  required this.iamgen, required this.imagenes});
}
//*lista de las publicaciones favoritas
class ListaLlenaFavoritos{
  
final listaFavoritos = <ListaFavoritos>[
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Maria 1',
          precio: '350.000',
          iamgen: 'assets/publicaciones/pub1.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Carrear 10 # 10-78',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub2.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Carrera 18 # 104-125',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub3.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub4.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub5.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
       ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 1',
          precio: '350.000',
          iamgen: 'assets/publicaciones/pub1.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Carrear 10 # 10-78',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub2.jpg',
         imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Carrera 18 # 104-125',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub3.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Maria 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub4.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
      ListaFavoritos(
          direccion: 'Calle 47 # 14-25',
          barrio: 'Santa Barbara 2',
          precio: '340.000',
          iamgen: 'assets/publicaciones/pub5.jpg',
          imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ];
}
