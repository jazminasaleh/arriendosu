import 'package:app_arriendosu/src/pages/publicar/ubicacion_inmueble_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

import '../../widgets/button.dart';
//*Pagina para comenzar a digitar los datos para subir un inmueble
//*Digitar datos como: ubicacion, fotos y el tipo de inmuble
class Publicar1Pagr extends StatefulWidget {
  @override
  State<Publicar1Pagr> createState() => _Publicar1PagrState();
}

class _Publicar1PagrState extends State<Publicar1Pagr> {
  //*precio
  var apartamento = false;
  var contador = 0;
  var habitacion = false;
  var contadorh = 0;

  @override
  Widget build(BuildContext context) {
    UbicacionInmuebleController _ubicacionController = new UbicacionInmuebleController();
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
                          controller:
                              _ubicacionController.ubicacionInmuebleController,
                          autocorrect: false,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Su dirección',
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
                        ),
                      ),
                    )
                  ],
                )),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                                Icons.house,
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
                Expanded(child: Container()),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                   child: ButtonApp(
                      onpress: _ubicacionController.ubicacion,
                          direccion: 'publicar2',
                          texto: 'Siguiente'),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
