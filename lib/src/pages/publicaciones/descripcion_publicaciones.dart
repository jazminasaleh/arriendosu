import 'package:app_arriendosu/src/pages/publicaciones/lista_favoritos.dart';
import 'package:flutter/material.dart';
import '../../widgets/slidesShow.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*mandar la lista de imagenes que van a ir en el slide de fotos
class DescripcionPublicaciones extends StatelessWidget {
  String direccion;
  String barrio;
  String precio;
  DescripcionPublicaciones({super.key, required this.direccion, required this.barrio, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      direccion,
                      style: TextStyle(
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
                      style: TextStyle(
                      fontSize: 18,
                      color: utils.Colors.blanco,
                      fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Color.fromARGB(221, 52, 52, 52),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Galeria', style: TextStyle(fontSize: 20, color: utils.Colors.blanco, fontWeight: FontWeight.w500),),
                    TextButton(onPressed: (){}, child: Text('Ver todo', style:  TextStyle(color: utils.Colors.ocre, fontSize: 15),))
                  ],
                )
              ],
            ),
        )
      );
  }
}
