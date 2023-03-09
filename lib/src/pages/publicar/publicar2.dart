import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

class Publicar2Page extends StatefulWidget {
  @override
  State<Publicar2Page> createState() => _Publicar2PageState();
}

class _Publicar2PageState extends State<Publicar2Page> {
//*Estrato, habitaciones, baños, area, antiguedad,
  bool internt = false;
  var contadorInt = 0;

  bool servicios = false;
  var contadorServicios = 0;

  bool garaje = false;
  var contadorGaraje = 0;

  bool muebles = false;
  var contadorMuebles = 0;

  bool lavadero = false;
  var contadorLavadero = 0;

  bool unaHabitacion = false;
  var contaodrUnaHbaitacion = 0;

  bool dosHabitacion = false;
  var contaodrDosHbaitacion = 0;

  bool tresHabitacion = false;
  var contaodrTresHbaitacion = 0;

  bool cuatroHabitacion = false;
  var contaodrCuatroHbaitacion = 0;

  bool cincoHabitacion = false;
  var contaodrCincoHbaitacion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'publicar1');
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        title: Text('Características'),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.90,
            color: utils.Colors.fondoOscuro,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side:
                                BorderSide(width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: internt,
                            onChanged: (value) {
                              setState(() {
                                if (contadorInt == 0) {
                                  contadorInt++;
                                  internt = true;
                                } else {
                                  contadorInt = 0;
                                  internt = false;
                                }
                              });
                            }),
                      ),
                      Text(
                        'Internet',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side:
                                BorderSide(width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: servicios,
                            onChanged: (value) {
                              setState(() {
                                if (contadorServicios == 0) {
                                  contadorServicios++;
                                  servicios = true;
                                } else {
                                  contadorServicios = 0;
                                  servicios = false;
                                }
                              });
                            }),
                      ),
                      Text(
                        'Servicios',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side:
                                BorderSide(width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: garaje,
                            onChanged: (value) {
                              setState(() {
                                if (contadorGaraje == 0) {
                                  contadorGaraje++;
                                  garaje = true;
                                } else {
                                  contadorGaraje = 0;
                                  garaje = false;
                                }
                              });
                            }),
                      ),
                      Text(
                        'Garaje',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side:
                                BorderSide(width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: muebles,
                            onChanged: (value) {
                              setState(() {
                                if (contadorMuebles == 0) {
                                  contadorMuebles++;
                                  muebles = true;
                                } else {
                                  contadorMuebles = 0;
                                  muebles = false;
                                }
                              });
                            }),
                      ),
                      Text(
                        'Muebles',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side:
                                BorderSide(width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: lavadero,
                            onChanged: (value) {
                              setState(() {
                                if (contadorLavadero == 0) {
                                  contadorLavadero++;
                                  lavadero = true;
                                } else {
                                  contadorLavadero = 0;
                                  lavadero = false;
                                }
                              });
                            }),
                      ),
                      Text(
                        'Lavadero',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: utils.Colors.azulOscuro,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Habitaciones',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: utils.Colors.blanco,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contaodrUnaHbaitacion++;
                                        if (contaodrUnaHbaitacion == 1) {
                                          unaHabitacion = true;
                                          contaodrUnaHbaitacion++;
                                          dosHabitacion = false;
                                          tresHabitacion = false;
                                          cuatroHabitacion = false;
                                          cincoHabitacion = false;
                                        } else {
                                          unaHabitacion = false;
                                          contaodrUnaHbaitacion = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: unaHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contaodrDosHbaitacion++;
                                        if (contaodrDosHbaitacion == 1) {
                                          dosHabitacion = true;
                                          contaodrDosHbaitacion++;
                                           unaHabitacion =false;
                                          tresHabitacion = false;
                                          cuatroHabitacion = false;
                                          cincoHabitacion = false;
                                        } else {
                                          dosHabitacion = false;
                                          contaodrDosHbaitacion = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: dosHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contaodrTresHbaitacion++;
                                        if (contaodrTresHbaitacion == 1) {
                                          tresHabitacion = true;
                                          contaodrTresHbaitacion++;
                                          unaHabitacion = false;
                                          dosHabitacion = false;
                                          cuatroHabitacion = false;
                                          cincoHabitacion = false;
                                        } else {
                                          tresHabitacion = false;
                                          contaodrTresHbaitacion = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: tresHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contaodrCuatroHbaitacion++;
                                        if (contaodrCuatroHbaitacion == 1) {
                                          cuatroHabitacion = true;
                                          contaodrCuatroHbaitacion++;
                                          unaHabitacion = false;
                                          dosHabitacion = false;
                                          tresHabitacion = false;
                                          cincoHabitacion = false;
                                        } else {
                                          cuatroHabitacion = false;
                                          contaodrCuatroHbaitacion = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: cuatroHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '4',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contaodrCincoHbaitacion++;
                                        if (contaodrCincoHbaitacion == 1) {
                                          cincoHabitacion = true;
                                          contaodrCincoHbaitacion++;
                                          unaHabitacion = false;
                                          dosHabitacion = false;
                                          tresHabitacion = false;
                                          cuatroHabitacion = false;
                                        } else {
                                          cincoHabitacion = false;
                                          contaodrCincoHbaitacion = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: cincoHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        '5+',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
