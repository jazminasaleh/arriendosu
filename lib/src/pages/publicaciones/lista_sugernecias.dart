
//*Lista de inmuebles sugeridos
import 'package:flutter/cupertino.dart';

class ListaSugernecias {
  final String direccion;
  final String barrio;
  final String precio;
  final String iamgen;
  List <Widget> imagenes;

  ListaSugernecias({required this.direccion, required this.barrio, required this.precio,required this.iamgen, required this.imagenes});
}

class ListaLlenaSugerencias {
  final listaSugerencias = <ListaSugernecias>[
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 1',
        precio: '350.000',
        iamgen: 'assets/publicaciones/pub1.jpg', 
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub1.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Carrear 10 # 10-78',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub2.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
       
    ListaSugernecias(
        direccion: 'Carrera 18 # 104-125',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub3.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub3.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub4.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub4.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub5.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub5.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 1',
        precio: '350.000',
        iamgen: 'assets/publicaciones/pub1.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub1.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Carrear 10 # 10-78',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub2.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Carrera 18 # 104-125',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub3.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub3.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub4.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub4.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
    ListaSugernecias(
        direccion: 'Calle 47 # 14-25',
        barrio: 'Santa Barbara 2',
        precio: '340.000',
        iamgen: 'assets/publicaciones/pub5.jpg',
        imagenes: [Image(image:  AssetImage('assets/publicaciones/pub5.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')), Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),Image(image:  AssetImage('assets/publicaciones/pub2.jpg')),]),
  ];
}
