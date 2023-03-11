import 'package:app_arriendosu/src/pages/publicar/publicar2.dart';
import 'package:app_arriendosu/src/pages/publicar/ubicacion_inmueble_controller.dart';
import 'package:app_arriendosu/src/provider/publicar_inmueble.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

//*Pagina para comenzar a digitar los datos para subir un inmueble
//*Digitar datos como: ubicacion, fotos y el tipo de inmuble
class Publicar1Pagr extends StatefulWidget {
  @override
  State<Publicar1Pagr> createState() => _Publicar1PagrState();
}

class _Publicar1PagrState extends State<Publicar1Pagr> {
  UbicacionInmuebleController ubicacionController =
      new UbicacionInmuebleController();
  //*precio
  bool apartamento = false;
  var contador = 0;
  bool habitacion = false;
  var contadorh = 0;
  int contadorbtn = 0;
  bool validUbicacion = false;
  bool validPrecio = false;
  bool validTipo = false;
   
  @override
  Widget build(BuildContext context) {
    final publicarInmueble = Provider.of<PublicarProvider>(context);

    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'perfil');
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        title: const Text('Publicar'),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            //*Quitar el teclado
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
              children: [
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
                              onChanged: (value) =>
                                  publicarInmueble.ubicacion = value,
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
                              onChanged: (value) =>
                                  publicarInmueble.precio = value,
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
                          apartamento = true;
                          contador++;
                          habitacion = false;
                        } else {
                          apartamento = false;
                          contador = 0;
                        }
                      });
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: apartamento
                              ? utils.Colors.ocre
                              : utils.Colors.grisClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.house,
                                color: apartamento
                                    ? utils.Colors.fondoOscuro
                                    : utils.Colors.grisOscuro,
                                size: 30,
                              )),
                          Text(
                            'Apartamento',
                            style: TextStyle(
                                fontSize: 20,
                                color: apartamento
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
                          habitacion = true;
                          contadorh++;
                          apartamento = false;
                        } else {
                          habitacion = false;
                          contadorh = 0;
                        }
                      });
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: habitacion
                              ? utils.Colors.ocre
                              : utils.Colors.grisClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.bed,
                                color: habitacion
                                    ? utils.Colors.fondoOscuro
                                    : utils.Colors.grisOscuro,
                                size: 30,
                              )),
                          Text(
                            'Habitación',
                            style: TextStyle(
                                fontSize: 20,
                                color: habitacion
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
                Expanded(child: Container()),
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
                              if (publicarInmueble.ubicacion.length >= 7) {
                                contadorbtn++;
                                validUbicacion = false;
                              } else {
                                validUbicacion = true;
                                validacionUbicacion(validPrecio);
                              }

                              if (publicarInmueble.precio.length >= 5) {
                                contadorbtn++;
                                validPrecio = false;
                              } else {
                                validPrecio = true;
                                validacionPrecio(validPrecio);
                              }

                              if (apartamento == true || habitacion == true) {
                                validTipo = false;
                                contadorbtn++;
                                if (apartamento == true) {
                                  publicarInmueble.tipo = 'apartamento';
                                } else {
                                  publicarInmueble.tipo = 'habitacion';
                                }
                              } else {
                                validTipo = true;
                                validacionTipo(validTipo);
                              }

                              if (contadorbtn >= 3) {
                                ubicacionController
                                        .ubicacionInmuebleController =
                                    publicarInmueble.ubicacion;
                                ubicacionController.precioInmuebleController =
                                    publicarInmueble.precio;
                                ubicacionController.tipoInmuebleController =
                                    publicarInmueble.tipo;

                                publicarInmueble.ubicacion = '';
                                publicarInmueble.precio = '';
                                publicarInmueble.tipo = '';

                                publicarInmueble.isLoading = true;
                                ubicacionController.carga = true;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Publicar2Page(
                                            ubicacionController)));
                                publicarInmueble.isLoading = false;
                              } else {
                                publicarInmueble.isLoading = false;
                               
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
}
