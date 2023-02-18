import 'package:app_arriendosu/src/pages/publicaciones/galeria_imagenes.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*pagina descripcion de publicaciones
class DescripcionPublicaciones extends StatelessWidget {
  final List<Widget> slides;
  String direccion;
  String barrio;
  String precio;
  DescripcionPublicaciones(
      {super.key,
      required this.direccion,
      required this.barrio,
      required this.precio, required this.slides});

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
          Row(
            children: [
              Container(
                height: 150,
                child: Column(
                  children: [
                    Expanded(child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 140,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            opacity: 0.50,
                            image: AssetImage(''),
                            fit: BoxFit.cover,
                          )),
                      );
                    }))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
