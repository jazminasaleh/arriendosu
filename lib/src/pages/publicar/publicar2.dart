import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*Pagina donde muestra la segunda parte para publicar el inmueble
//*Como lo son sus caracteristicas, estrato, habitacionesa y área
class Publicar2Page extends StatefulWidget {
  @override
  State<Publicar2Page> createState() => _Publicar2PageState();
}

class _Publicar2PageState extends State<Publicar2Page> {
  bool internt = false,
      servicios = false,
      garaje = false,
      muebles = false,
      lavadero = false,
      unaHabitacion = false,
      dosHabitacion = false,
      tresHabitacion = false,
      cuatroHabitacion = false,
      cincoHabitacion = false;
  var contadorInt = 0,
      contadorServicios = 0,
      contadorGaraje = 0,
      contadorMuebles = 0,
      contadorLavadero = 0,
      contaodrUnaHbaitacion = 0,
      contaodrDosHbaitacion = 0,
      contaodrTresHbaitacion = 0,
      contaodrCuatroHbaitacion = 0,
      contaodrCincoHbaitacion = 0;

  var contadorEstratoCero = 0,
      contadorEstratoUno = 0,
      contadorEstratoDos = 0,
      contadorEstratoTres = 0,
      contadorEstratoCuatro = 0,
      contadorEstartoCinco = 0;
  var estratoCero = false,
      estratoUno = false,
      estratoDos = false,
      estratoTres = false,
      estratoCuatro = false,
      estratoCinco = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'publicar1');
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        title: const Text('Características'),
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
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
                      const Text(
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
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
                      const Text(
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
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
                      const Text(
                        'Parqueadero',
                        style: TextStyle(
                            fontSize: 25,
                            color: utils.Colors.blanco,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
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
                      const Text(
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
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
                      const Text(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: utils.Colors.azulOscuro,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Habitaciones',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: utils.Colors.blanco,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
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
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: unaHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                          unaHabitacion = false;
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
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: dosHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: tresHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                      child: const Text(
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
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: cincoHabitacion
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: utils.Colors.azulOscuro,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Estrato',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: utils.Colors.blanco,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        contadorEstratoCero++;
                                        if (contadorEstratoCero == 1) {
                                          estratoCero = true;
                                          contadorEstratoCero++;
                                          estratoDos = false;
                                          estratoTres = false;
                                          estratoUno = false;
                                          estratoCuatro = false;
                                          estratoCinco = false;
                                        } else {
                                          estratoCero = false;
                                          contadorEstratoCero = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoCero
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        '0',
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
                                        contadorEstratoUno++;
                                        if (contadorEstratoUno == 1) {
                                          estratoUno = true;
                                          contadorEstratoUno++;
                                          estratoCero = false;
                                          estratoDos = false;
                                          estratoTres = false;
                                          estratoCuatro = false;
                                          estratoCinco = false;
                                        } else {
                                          estratoUno = false;
                                          contadorEstratoUno = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoUno
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                        contadorEstratoDos++;
                                        if (contadorEstratoDos == 1) {
                                          contadorEstratoDos++;
                                          estratoDos    = true;
                                          estratoUno    = false;
                                          estratoCero   = false;
                                          estratoTres   = false;
                                          estratoCuatro =  false;
                                          estratoCinco  = false;
                                        } else {
                                          estratoDos = false;
                                          contadorEstratoDos = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoDos
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                        contadorEstratoTres++;
                                        if (contadorEstratoTres == 1) {
                                          estratoTres = true;
                                          contadorEstratoTres++;
                                          estratoDos    = false;
                                          estratoUno    = false;
                                          estratoCero   = false;
                                          estratoCuatro =  false;
                                          estratoCinco  = false;
                                        } else {
                                          estratoTres = false;
                                          contadorEstratoTres = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoTres
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                        contadorEstratoCuatro ++;
                                        if (contadorEstratoCuatro == 1) {
                                          contadorEstratoCuatro ++;
                                          estratoDos    = false;
                                          estratoUno    = false;
                                          estratoCero   = false;
                                          estratoCuatro = true;
                                          estratoCinco  = false;
                                          estratoTres   = false;
                                        } else {
                                          estratoTres = false;
                                          contadorEstratoCuatro = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoCuatro
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
                                        contadorEstartoCinco ++;
                                        if (contadorEstartoCinco == 1) {
                                          contadorEstartoCinco ++;
                                          estratoDos    = false;
                                          estratoUno    = false;
                                          estratoCero   = false;
                                          estratoCuatro = false;
                                          estratoCinco  = true;
                                          estratoTres   = false;
                                        } else {
                                          estratoCinco = false;
                                          contadorEstartoCinco = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.095,
                                      decoration: BoxDecoration(
                                          color: estratoCinco
                                              ? utils.Colors.ocre
                                              : utils.Colors.grisClaro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
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
