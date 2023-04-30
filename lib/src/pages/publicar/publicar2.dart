import 'package:app_arriendosu/src/pages/publicar/publicar1.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar3.dart';
import 'package:app_arriendosu/src/provider/publicar_inmueble.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

//*Pagina donde muestra la segunda parte para publicar el inmueble
//*Como lo son sus caracteristicas, estrato, habitacionesa y área
class Publicar2Page extends StatefulWidget {
  PublicarProvider _publicarController = new PublicarProvider();
  String? apellido, correo, nombrePersona, telefono;
  bool? whatsapp, telegram;
  Publicar2Page(this._publicarController, this.apellido, this.correo, this.nombrePersona, this.telefono, this.whatsapp, this.telegram);
  @override
  State<Publicar2Page> createState() =>
      _Publicar2PageState(this._publicarController,  this.apellido, this.correo, this.nombrePersona, this.telefono, this.whatsapp, this.telegram);
}

class _Publicar2PageState extends State<Publicar2Page> {
  PublicarProvider _publicarController;
   String? apellido, correo, nombrePersona, telefono;
  bool? whatsapp, telegram;
  _Publicar2PageState(this._publicarController,  this.apellido, this.correo, this.nombrePersona, this.telefono, this.whatsapp, this.telegram);

  bool unaHabitacion = false,
      dosHabitacion = false,
      tresHabitacion = false,
      cuatroHabitacion = false,
      cincoHabitacion = false;

  bool unBano = false,
      dosBanos = false,
      tresBanos = false,
      cuatroBanos = false,
      cincoBanos = false;

  var contadorInt = 0,
      contadorServicios = 0,
      contadorGaraje = 0,
      contadorMuebles = 0,
      contadorLavadero = 0,
      contaodrUnaHbaitacion = 0,
      contaodrDosHbaitacion = 0,
      contaodrTresHbaitacion = 0,
      contaodrCuatroHbaitacion = 0,
      contaodrCincoHbaitacion = 0,
      contaodrUnBano = 0,
      contaodrDosBanos = 0,
      contaodrTresBanos = 0,
      contaodrCuatroBanos = 0,
      contaodrCincoBanos = 0;

  var contadorEstratoCero = 0,
      contadorEstratoUno = 0,
      contadorEstratoDos = 0,
      contadorEstratoTres = 0,
      contadorEstratoCuatro = 0,
      contadorEstartoCinco = 0,
      contadorbtn = 0;
  bool estratoCero = false,
      estratoUno = false,
      estratoDos = false,
      estratoTres = false,
      estratoCuatro = false,
      estratoCinco = false,
      validArea = false,
      validHabitaciones = false,
      validaEstrato = false;

  @override
  Widget build(BuildContext context) {
    final publicarInmueble = Provider.of<PublicarProvider>(context);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>Publicar1Pagr(apellido: apellido, correo: correo, nombrePersona: nombrePersona, telefono: telefono, telegram: telegram, whatsapp: whatsapp,)));
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
                                width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: publicarInmueble.internt,
                            onChanged: (value) {
                              setState(() {
                                if (contadorInt == 0) {
                                  contadorInt++;
                                  publicarInmueble.internt = true;
                                } else {
                                  contadorInt = 0;
                                  publicarInmueble.internt = false;
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
                            value: publicarInmueble.servicios,
                            onChanged: (value) {
                              setState(() {
                                if (contadorServicios == 0) {
                                  contadorServicios++;
                                  publicarInmueble.servicios = true;
                                } else {
                                  contadorServicios = 0;
                                  publicarInmueble.servicios = false;
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
                            value: publicarInmueble.parqueadero,
                            onChanged: (value) {
                              setState(() {
                                if (contadorGaraje == 0) {
                                  contadorGaraje++;
                                  publicarInmueble.parqueadero = true;
                                } else {
                                  contadorGaraje = 0;
                                  publicarInmueble.parqueadero = false;
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
                            value: publicarInmueble.muebles,
                            onChanged: (value) {
                              setState(() {
                                if (contadorMuebles == 0) {
                                  contadorMuebles++;
                                  publicarInmueble.muebles = true;
                                } else {
                                  contadorMuebles = 0;
                                  publicarInmueble.muebles = false;
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
                            value: publicarInmueble.lavadero,
                            onChanged: (value) {
                              setState(() {
                                if (contadorLavadero == 0) {
                                  contadorLavadero++;
                                  publicarInmueble.lavadero = true;
                                } else {
                                  contadorLavadero = 0;
                                  publicarInmueble.lavadero = false;
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
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 30, bottom: 10),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        color: utils.Colors.grisMedio,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Área del inmueble',
                          labelText: 'Área en m²',
                          prefixIcon: Icon(
                            Icons.area_chart,
                            size: 30,
                          ),
                          iconColor: Color(0xff3A4750),
                          labelStyle: TextStyle(
                              color: Color(0xff3A4750),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      onChanged: (value) => publicarInmueble.area = value,
                    ),
                  ),
                ),
                validacionArea(validArea),
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                //*Baños
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                                'Baños',
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
                                          contaodrUnBano++;
                                          if (contaodrUnBano == 1) {
                                            unBano= true;
                                            contaodrUnBano++;
                                            dosBanos = false;
                                            tresBanos = false;
                                            cuatroBanos = false;
                                            cincoBanos = false;
                                          } else {
                                            unBano = false;
                                            contaodrUnBano = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.095,
                                        decoration: BoxDecoration(
                                            color: unBano
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
                                          contaodrDosBanos++;
                                          if (contaodrDosBanos == 1) {
                                            dosBanos = true;
                                            contaodrDosBanos++;
                                            unBano = false;
                                            tresBanos = false;
                                            cuatroBanos = false;
                                            cincoBanos = false;
                                          } else {
                                            dosBanos = false;
                                            contaodrDosBanos = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.095,
                                        decoration: BoxDecoration(
                                            color: dosBanos
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
                                          contaodrTresBanos++;
                                          if (contaodrTresBanos == 1) {
                                            tresBanos = true;
                                            contaodrTresBanos++;
                                            unBano = false;
                                            dosBanos = false;
                                            cuatroBanos = false;
                                            cincoBanos = false;
                                          } else {
                                            tresBanos = false;
                                            contaodrTresBanos = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.095,
                                        decoration: BoxDecoration(
                                            color: tresBanos
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
                                          contaodrCuatroBanos++;
                                          if (contaodrCuatroBanos == 1) {
                                            cuatroBanos = true;
                                            contaodrCuatroBanos++;
                                            unBano = false;
                                            dosBanos = false;
                                            tresBanos = false;
                                            cincoBanos = false;
                                          } else {
                                            cuatroBanos = false;
                                            contaodrCuatroBanos = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: cuatroBanos
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
                                          contaodrCincoBanos++;
                                          if (contaodrCincoBanos == 1) {
                                            cincoBanos = true;
                                            contaodrCincoBanos++;
                                            unBano = false;
                                            dosBanos = false;
                                            tresBanos = false;
                                            cuatroBanos = false;
                                          } else {
                                            cincoBanos = false;
                                            contaodrCincoBanos = 0;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.095,
                                        decoration: BoxDecoration(
                                            color: cincoBanos
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
                    )),
                validacionHabitacion(validHabitaciones),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                          estratoDos = true;
                                          estratoUno = false;
                                          estratoCero = false;
                                          estratoTres = false;
                                          estratoCuatro = false;
                                          estratoCinco = false;
                                        } else {
                                          estratoDos = false;
                                          contadorEstratoDos = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                          estratoDos = false;
                                          estratoUno = false;
                                          estratoCero = false;
                                          estratoCuatro = false;
                                          estratoCinco = false;
                                        } else {
                                          estratoTres = false;
                                          contadorEstratoTres = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                        contadorEstratoCuatro++;
                                        if (contadorEstratoCuatro == 1) {
                                          contadorEstratoCuatro++;
                                          estratoDos = false;
                                          estratoUno = false;
                                          estratoCero = false;
                                          estratoCuatro = true;
                                          estratoCinco = false;
                                          estratoTres = false;
                                        } else {
                                          estratoTres = false;
                                          contadorEstratoCuatro = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                                        contadorEstartoCinco++;
                                        if (contadorEstartoCinco == 1) {
                                          contadorEstartoCinco++;
                                          estratoDos = false;
                                          estratoUno = false;
                                          estratoCero = false;
                                          estratoCuatro = false;
                                          estratoCinco = true;
                                          estratoTres = false;
                                        } else {
                                          estratoCinco = false;
                                          contadorEstartoCinco = 0;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                      width: MediaQuery.of(context).size.width *
                                          0.095,
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
                ),
                validacionEstratos(validaEstrato),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 20, right: 20),
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
                          : () async {
                              FocusScope.of(context).unfocus();
                              contadorbtn = 0;
                              if (publicarInmueble.area.length >= 2) {
                                contadorbtn++;
                                validArea = false;
                              } else {
                                validArea = true;
                                validacionArea(validArea);
                              }

                              if (unaHabitacion == true ||
                                  dosHabitacion == true ||
                                  tresHabitacion == true ||
                                  cuatroHabitacion == true ||
                                  cincoHabitacion == true) {
                                contadorbtn++;
                                validHabitaciones = false;
                                if (unaHabitacion == true) {
                                  publicarInmueble.habitaciones = 'una';
                                } else if (dosHabitacion == true) {
                                  publicarInmueble.habitaciones = 'dos';
                                } else if (tresHabitacion == true) {
                                  publicarInmueble.habitaciones = 'tres';
                                } else if (cuatroHabitacion == true) {
                                  publicarInmueble.habitaciones = 'cuatro';
                                } else {
                                  publicarInmueble.habitaciones = 'cinco o mas';
                                }
                              } else {
                                validHabitaciones = true;
                              }

                              if (estratoCero == true ||
                                  estratoUno == true ||
                                  estratoDos == true ||
                                  estratoTres == true ||
                                  estratoCuatro == true ||
                                  estratoCinco == true) {
                                contadorbtn++;
                                validaEstrato = false;
                                if (estratoCero == true) {
                                  publicarInmueble.estrato = 'cero';
                                } else if (estratoUno == true) {
                                  publicarInmueble.estrato = 'uno';
                                } else if (estratoDos == true) {
                                  publicarInmueble.estrato = 'dos';
                                } else if (estratoTres == true) {
                                  publicarInmueble.habitaciones = 'tres';
                                } else if (estratoCuatro == true) {
                                  publicarInmueble.estrato = 'cuatro';
                                } else {
                                  publicarInmueble.estrato = 'cinco o mas';
                                }
                              } else {
                                validaEstrato = true;
                              }

                              if (contadorbtn >= 3) {
                                publicarInmueble.isLoading = true;
                                publicarInmueble.isLoading = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Publicar3Page(
                                            _publicarController, apellido, correo, nombrePersona, telefono, whatsapp, telegram)));
                                publicarInmueble.isLoading = false;
                              } else {
                                publicarInmueble.isLoading = false;
                              }
                            }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget validacionArea(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es un área' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget validacionHabitacion(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'Seleccione cantidad de habitaciones' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget validacionEstratos(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'Seleccione el estrato' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }
}
