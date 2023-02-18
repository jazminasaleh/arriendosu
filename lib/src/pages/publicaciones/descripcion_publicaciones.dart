import 'package:app_arriendosu/src/pages/publicaciones/galeria_imagenes.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*pagina descripcion de publicaciones
class DescripcionPublicaciones extends StatelessWidget {
  List slides;
  String direccion;
  String barrio;
  String precio;
  List iconosDetalles;
  List nombreDeatlles;
  List iconosRestricciones;
  List nombreRestricciones;
  String descripcion;
  DescripcionPublicaciones(
      {super.key,
      required this.direccion,
      required this.barrio,
      required this.precio,
      required this.slides,
      required this.iconosDetalles,
      required this.nombreDeatlles,
      required this.iconosRestricciones,
      required this.nombreRestricciones,
      required this.descripcion
      }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                direccion,
                style: const TextStyle(
                    fontSize: 25,
                    color: utils.Colors.blanco,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                barrio,
                style: const TextStyle(
                    fontSize: 18,
                    color: utils.Colors.blanco,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color.fromARGB(221, 52, 52, 52),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Galeria',
                style: TextStyle(
                    fontSize: 20,
                    color: utils.Colors.blanco,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GaleriaImagenes()),
                    );
                  },
                  child: const Text(
                    'Ver todo',
                    style: TextStyle(color: utils.Colors.ocre, fontSize: 15),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _galeria(slides: slides),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Detalles',
                style: TextStyle(
                    fontSize: 20,
                    color: utils.Colors.blanco,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _detalles(
              iconoDetalles: iconosDetalles, nombreDetalles: nombreDeatlles),
          Row(
            children: [
              Text(
                'Restricciones',
                style: TextStyle(
                    fontSize: 20,
                    color: utils.Colors.rojo,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
           SizedBox(
            height: 10,
          ),
          _restricciones(
            iconoRestricciones: iconosRestricciones,
            nombreRetricciones: nombreRestricciones,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}

class _galeria extends StatelessWidget {
  const _galeria({
    Key? key,
    required this.slides,
  }) : super(key: key);

  final List slides;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: slides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 140,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: slides[index],
                    );
                  }
              )
            )
        ],
      ),
    );
  }
}

class _detalles extends StatelessWidget {
  const _detalles({
    Key? key,
    required this.iconoDetalles,
    required this.nombreDetalles,
  }) : super(key: key);

  final List iconoDetalles;
  final List nombreDetalles;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: iconoDetalles.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: 90,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          iconoDetalles[index],
                          const SizedBox(height: 5,),
                          nombreDetalles[index]
                        ],
                      )
                    ],
                  )
                );
              }
            )
          )
        ],
      ),
    );
  }
}

class _restricciones extends StatelessWidget {
  const _restricciones({
    Key? key,
    required this.iconoRestricciones,
    required this.nombreRetricciones,
  }) : super(key: key);

  final List iconoRestricciones;
  final List nombreRetricciones;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: iconoRestricciones.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: 90,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          iconoRestricciones[index],
                          const SizedBox(height: 5,),
                          nombreRetricciones[index]
                        ],
                      )
                    ],
                  )
                );
              }
            )
          )
        ],
      ),
    );
  }
}
