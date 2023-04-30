import 'package:app_arriendosu/src/models/inmuebles.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:app_arriendosu/src/pages/publicaciones/listas_pages.dart';
import 'package:app_arriendosu/src/services/inmuebles_services.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

//*Pagina para comenzar a digitar los datos para subir un inmueble
//*Digitar datos como: ubicacion, fotos y el tipo de inmuble
class ActualizarInmueblePage extends StatefulWidget {
  String area;
  String id;
  String direccion;
  String barrio;
  String precio;
  String descripcion;
  String tipo;
  bool internt = false,
      servicios = false,
      parqueadero = false,
      muebles = false,
      lavadero = false;
  bool mascotas = false, fumar = false;
  String nombreArrendador, apellidoArrendador, telefonoArrendador, correo;
  bool telegram, whatsapp;
  String? cantHbaitaciones, cantbanos;
  String estrato;
  ActualizarInmueblePage(
      {required this.id,
      required this.area,
      required this.direccion,
      required this.barrio,
      required this.precio,
      required this.descripcion,
      required this.tipo,
      required this.internt,
      required this.servicios,
      required this.parqueadero,
      required this.muebles,
      required this.lavadero,
      required this.mascotas,
      required this.fumar,
      required this.nombreArrendador,
      required this.apellidoArrendador,
      required this.telefonoArrendador,
      required this.correo,
      required this.telegram,
      required this.whatsapp,
      this.cantHbaitaciones,
      this.cantbanos,
      required this.estrato});
  @override
  State<ActualizarInmueblePage> createState() => _ActualizarInmueblePage(
      id: id,
      direccion: direccion,
      apellidoArrendador: apellidoArrendador,
      barrio: barrio,
      correo: correo,
      descripcion: descripcion,
      estrato: estrato,
      fumar: fumar,
      internt: internt,
      lavadero: lavadero,
      mascotas: mascotas,
      muebles: muebles,
      nombreArrendador: nombreArrendador,
      parqueadero: parqueadero,
      precio: precio,
      servicios: servicios,
      telefonoArrendador: telefonoArrendador,
      telegram: telegram,
      tipo: tipo,
      whatsapp: whatsapp,
      area: area);
}

class _ActualizarInmueblePage extends State<ActualizarInmueblePage> {
  String id;
  String area;
  bool apartamento = false;
  var contador = 0;
  bool habitacion = false;
  var contadorh = 0;
  int contadorbtn = 0;
  bool validUbicacion = false;
  bool validPrecio = false;
  bool validTipo = false;

  String direccion;
  String barrio;
  String precio;
  String descripcion;
  String tipo;
  bool internt = false,
      servicios = false,
      parqueadero = false,
      muebles = false,
      lavadero = false;
  bool mascotas = false, fumar = false;
  String nombreArrendador, apellidoArrendador, telefonoArrendador, correo;
  bool telegram, whatsapp;
  String? cantHbaitaciones, cantbanos;
  String estrato;
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
      contaodrCincoBanos = 0,
      contadorMascotas = 0,
      contadorFumar = 0;
  bool validArea = false;
  _ActualizarInmueblePage(
      {required this.id,
      required this.area,
      required this.direccion,
      required this.barrio,
      required this.precio,
      required this.descripcion,
      required this.tipo,
      required this.internt,
      required this.servicios,
      required this.parqueadero,
      required this.muebles,
      required this.lavadero,
      required this.mascotas,
      required this.fumar,
      required this.nombreArrendador,
      required this.apellidoArrendador,
      required this.telefonoArrendador,
      required this.correo,
      required this.telegram,
      required this.whatsapp,
      this.cantHbaitaciones,
      this.cantbanos,
      required this.estrato});
  @override
  Widget build(BuildContext context) {
    final inmuebleService = Provider.of<InmueblesServices>(context);

    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('va de actualizaciones este correo $correo');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InicioPublicaciones(
                        correo: correo,
                      )),
            );
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        title: const Text('Actualizar el inmueble'),
      ),
      body: GestureDetector(
        onTap: () {
          //*Quitar el teclado
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Container(
            color: utils.Colors.fondoOscuro,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //*fromulario para llenar ubicacion, precio, fotos
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 10),
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                                color: utils.Colors.grisMedio,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              initialValue: direccion,
                              autocorrect: false,
                              keyboardType: TextInputType.streetAddress,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Dirección del inmueble',
                                  labelText: 'Ubicación',
                                  prefixIcon: Icon(
                                    Icons.location_on_rounded,
                                    size: 30,
                                  ),
                                  iconColor: Color(0xff3A4750),
                                  labelStyle: TextStyle(
                                      color: Color(0xff3A4750),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              onChanged: (value) => direccion = value,
                            ),
                          ),
                        ),
                        validacionUbicacion(validUbicacion),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                                color: utils.Colors.grisMedio,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              initialValue: precio,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Precio del inmueble',
                                  labelText: 'Precio',
                                  prefixIcon: Icon(
                                    Icons.attach_money_sharp,
                                    size: 30,
                                  ),
                                  iconColor: Color(0xff3A4750),
                                  labelStyle: TextStyle(
                                      color: Color(0xff3A4750),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              onChanged: (value) => precio = value,
                            ),
                          ),
                        )
                      ],
                    )),
                validacionPrecio(validPrecio),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        color: utils.Colors.grisMedio,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: utils.Colors.grisOscuro,
                            )),
                        const Text(
                          'Fotos',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff3A4750),
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_a_photo,
                                size: 30,
                                color: utils.Colors.verde,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                //*tipo de inmubeble ya sea partamneto o habitacion
                const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Tipo de inmueble',
                      style: TextStyle(
                          fontSize: 30,
                          color: utils.Colors.blanco,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        contador++;
                        if (contador == 1) {
                          tipo = 'apartamento';
                          apartamento = true;
                          contador++;
                          habitacion = false;
                        } else {
                          apartamento = false;
                          tipo = '';
                          contador = 0;
                        }
                      });
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: tipo == 'apartamento'
                              ? utils.Colors.ocre
                              : utils.Colors.grisClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.house,
                                color: tipo == 'apartamento'
                                    ? utils.Colors.fondoOscuro
                                    : utils.Colors.grisOscuro,
                                size: 30,
                              )),
                          Text(
                            'Apartamento',
                            style: TextStyle(
                                fontSize: 20,
                                color: tipo == 'apartamento'
                                    ? utils.Colors.fondoOscuro
                                    : const Color(0xff3A4750),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        contadorh++;
                        if (contadorh == 1) {
                          tipo = 'habitacion';
                          habitacion = true;
                          contadorh++;
                          apartamento = false;
                        } else {
                          tipo = '';
                          habitacion = false;
                          contadorh = 0;
                        }
                      });
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: tipo == 'habitacion'
                              ? utils.Colors.ocre
                              : utils.Colors.grisClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.bed,
                                color: tipo == 'habitacion'
                                    ? utils.Colors.fondoOscuro
                                    : utils.Colors.grisOscuro,
                                size: 30,
                              )),
                          Text(
                            'Habitación',
                            style: TextStyle(
                                fontSize: 20,
                                color: tipo == 'habitacion'
                                    ? utils.Colors.fondoOscuro
                                    : const Color(0xff3A4750),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                validacionTipo(validTipo),
                Text(
                  'Detalles',
                  style: TextStyle(
                      fontSize: 30,
                      color: utils.Colors.blanco,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                  padding: const EdgeInsets.only(left: 20),
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                            side: const BorderSide(
                                width: 2, color: utils.Colors.ocre),
                            checkColor: utils.Colors.fondoOscuro,
                            activeColor: utils.Colors.ocre,
                            value: parqueadero,
                            onChanged: (value) {
                              setState(() {
                                if (contadorGaraje == 0) {
                                  contadorGaraje++;
                                  parqueadero = true;
                                } else {
                                  contadorGaraje = 0;
                                  parqueadero = false;
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
                  padding: const EdgeInsets.only(left: 20),
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
                  padding: const EdgeInsets.only(left: 20),
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
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 30, bottom: 10),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        color: utils.Colors.grisMedio,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      initialValue: area,
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
                      onChanged: (value) => area = value,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Restricciones',
                    style: TextStyle(
                        fontSize: 30,
                        color: utils.Colors.blanco,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
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
                            value: mascotas,
                            onChanged: (value) {
                              setState(() {
                                if (contadorMascotas == 0) {
                                  contadorMascotas++;
                                  mascotas = true;
                                } else {
                                  contadorMascotas = 0;
                                  mascotas = false;
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
                    left: 20,
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
                            value: fumar,
                            onChanged: (value) {
                              setState(() {
                                if (contadorFumar == 0) {
                                  contadorFumar++;
                                  fumar = true;
                                } else {
                                  contadorFumar = 0;
                                  fumar = false;
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
                validacionArea(validArea),
                //*boton
                Padding(
                    padding: const EdgeInsets.only(bottom: 50),
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
                            'Actualizar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )),
                      onPressed: inmuebleService.isLoading
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              contadorbtn = 0;
                              if (direccion.length >= 7) {
                                contadorbtn++;
                                validUbicacion = false;
                              } else {
                                validUbicacion = true;
                                validacionUbicacion(validPrecio);
                              }

                              if (precio.length >= 5) {
                                contadorbtn++;
                                validPrecio = false;
                              } else {
                                validPrecio = true;
                                validacionPrecio(validPrecio);
                              }

                              if (tipo == 'apartamento' ||
                                  tipo == 'habitacion') {
                                validTipo = false;
                                contadorbtn++;
                                if (apartamento == true) {
                                  tipo = 'apartamento';
                                } else {
                                  tipo = 'habitacion';
                                }
                              } else {
                                validTipo = true;
                                validacionTipo(validTipo);
                              }
                              if (area.length >= 2) {
                                contadorbtn++;
                                validArea = false;
                              } else {
                                validArea = true;
                                validacionArea(validArea);
                              }

                              if (contadorbtn >= 3) {
                                contadorbtn = 0;
                                inmuebleService.isLoading = true;
                                inmuebleService.guardarOCrearInmueble(Inmuebles(
                                    apellidos: apellidoArrendador,
                                    id: id,
                                    area: int.parse(area),
                                    cantHabitaciones: 0,
                                    cantbanos: 0,
                                    correo: correo,
                                    descripcion: descripcion,
                                    direccion: direccion,
                                    estrato: int.parse(estrato),
                                    fotos: '',
                                    fumar: fumar,
                                    internt: internt,
                                    lavadero: lavadero,
                                    mascotas: mascotas,
                                    muebles: muebles,
                                    nombreInmueble: barrio,
                                    nombrePersona: nombreArrendador,
                                    parqueadero: parqueadero,
                                    precio: int.parse(precio),
                                    servicios: servicios,
                                    telegram: telegram,
                                    tipo: tipo,
                                    whatsapp: whatsapp,
                                    telefono: int.parse(telefonoArrendador)));
                                inmuebleService.isLoading = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListasPage(
                                            titulo: 'Mis publicaciones',
                                            editar: true,
                                            correoo: correo,
                                          )),
                                );
                              } else {
                                inmuebleService.isLoading = false;
                              }
                            },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

//*mensaje de que la ubicacion no esta bien
  Widget validacionUbicacion(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es una ubicación' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

//*mesnaje de que el precio n esta bien
  Widget validacionPrecio(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es un precio' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

//*mensaje de que debe de seleccionafr un tipo de  inmubeble
  Widget validacionTipo(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'Seleccione un tipo de inmueble' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
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
}
