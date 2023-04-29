import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar2.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';
import '../../provider/publicar_inmueble.dart';

class Publicar3Page extends StatefulWidget {
  PublicarProvider _ubicacionController = new PublicarProvider();

  Publicar3Page(this._ubicacionController);

  @override
  State<Publicar3Page> createState() => _Publicar3PageState();
}

class _Publicar3PageState extends State<Publicar3Page> {
  var contadorMascotas = 0;
  var contadorFumar = 0;

  @override
  Widget build(BuildContext context) {
    final publicarInmueble = Provider.of<PublicarProvider>(context);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Publicar2Page(widget._ubicacionController)));
          },
        ),
        title: const Text('Restricciones'),
      ),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Container(
          color: utils.Colors.fondoOscuro,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                          side: const BorderSide(
                              width: 2, color: utils.Colors.rojo),
                          checkColor: utils.Colors.fondoOscuro,
                          activeColor: utils.Colors.rojo,
                          value: publicarInmueble.mascotas,
                          onChanged: (value) {
                            setState(() {
                              if (contadorMascotas == 0) {
                                contadorMascotas++;
                                publicarInmueble.mascotas = true;
                              } else {
                                contadorMascotas = 0;
                                publicarInmueble.mascotas = false;
                              }
                            });
                          }),
                    ),
                    const Text(
                      'Permiten mascotas',
                      style: TextStyle(
                          fontSize: 25,
                          color: utils.Colors.blanco,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                          side: const BorderSide(
                              width: 2, color: utils.Colors.rojo),
                          checkColor: utils.Colors.fondoOscuro,
                          activeColor: utils.Colors.rojo,
                          value: publicarInmueble.fumar,
                          onChanged: (value) {
                            setState(() {
                              if (contadorFumar == 0) {
                                contadorFumar++;
                                publicarInmueble.fumar = true;
                              } else {
                                contadorFumar = 0;
                                publicarInmueble.fumar = false;
                              }
                            });
                          }),
                    ),
                    const Text(
                      'Permite fumar',
                      style: TextStyle(
                          fontSize: 25,
                          color: utils.Colors.blanco,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
             
            
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 30),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  disabledColor: utils.Colors.grisOscuro,
                  elevation: 0,
                  color: utils.Colors.ocre,
                  height: 60,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      child: const Text(
                        'Publicar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      )),
                  onPressed: publicarInmueble.isLoading
                      ? null
                      : () async {
                          //*Aqui almacenas la info en la base de datos, ya que despues todo se borra
                          publicarInmueble.ubicacion = '';
                          publicarInmueble.precio = '';
                          publicarInmueble.tipo = '';
                          publicarInmueble.internt = false;
                          publicarInmueble.servicios = false;
                          publicarInmueble.servicios = false;
                          publicarInmueble.parqueadero = false;
                          publicarInmueble.muebles = false;
                          publicarInmueble.lavadero = false;
                          publicarInmueble.area = '';
                          publicarInmueble.habitaciones = '';
                          publicarInmueble.estrato = '';
                          publicarInmueble.mascotas = false;
                          publicarInmueble.fumar = false;
                          publicarInmueble.isLoading = false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PerfilPage()));
                        },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
