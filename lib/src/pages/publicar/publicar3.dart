import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar2.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';
import '../../provider/publicar_inmueble.dart';


class Publicar3Page extends StatefulWidget {
  PublicarProvider _ubicacionController =
      new PublicarProvider();

  Publicar3Page(this._ubicacionController);

  @override
  State<Publicar3Page> createState() => _Publicar3PageState();
}

class _Publicar3PageState extends State<Publicar3Page> {
  var contadorMascotas = 0;
  var contadorFumar = 0;
  var contadorPersonas = 0;
  var contadorHorario = 0;
  var contadorLavado = 0;
  var contadorFiestas = 0;

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
                            value: publicarInmueble.personas,
                            onChanged: (value) {
                              setState(() {
                                if (contadorPersonas == 0) {
                                  contadorPersonas++;
                                  publicarInmueble.personas = true;
                                } else {
                                  contadorPersonas = 0;
                                  publicarInmueble.personas = false;
                                }
                              });
                            }),
                      ),
                      const Text(
                        'Entrar personas externas',
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
                            value: publicarInmueble.horario,
                            onChanged: (value) {
                              setState(() {
                                if (contadorHorario == 0) {
                                  contadorHorario++;
                                  publicarInmueble.horario = true;
                               
                                } else {
                                  contadorHorario = 0;
                                  publicarInmueble.horario = false;
                                }
                              });
                            }),
                      ),
                      const Text(
                        'Horario de llegada',
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
                            value: publicarInmueble.lavadado,
                            onChanged: (value) {
                              setState(() {
                                if (contadorLavado == 0) {
                                  contadorLavado++;
                                  publicarInmueble.lavadado = true;
                                } else {
                                  contadorLavado = 0;
                                  publicarInmueble.lavadado = false;
                                }
                              });
                            }),
                      ),
                      const Text(
                        'Permite usar lavadero',
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
                            value: publicarInmueble.fiestas,
                            onChanged: (value) {
                              setState(() {
                                if (contadorFiestas == 0) {
                                  contadorFiestas++;
                                  publicarInmueble.fiestas = true;
                                } else {
                                  contadorFiestas = 0;
                                  publicarInmueble.fiestas = false;
                                }
                              });
                            }),
                      ),
                      const Text(
                        'Permite realizar fiestas',
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
                              'Siguiente',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            )),
                    onPressed: publicarInmueble.isLoading
                    ? null
                    : () async{
                       publicarInmueble.isLoading = false;
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => 
                            PerfilPage()
                          )
                        );
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
