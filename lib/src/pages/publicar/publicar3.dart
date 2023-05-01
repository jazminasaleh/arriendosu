import 'package:app_arriendosu/src/models/inmuebles.dart';
import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar2.dart';
import 'package:app_arriendosu/src/services/inmuebles_services.dart';
import 'package:app_arriendosu/src/services/usuarios_services.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';
import '../../provider/publicar_inmueble.dart';

class Publicar3Page extends StatefulWidget {
  PublicarProvider _ubicacionController = new PublicarProvider();
  String? apellido, correo, nombrePersona, telefono;
  bool? whatsapp, telegram;
  Publicar3Page(this._ubicacionController, this.apellido, this.correo,
      this.nombrePersona, this.telefono, this.whatsapp, this.telegram);

  @override
  State<Publicar3Page> createState() => _Publicar3PageState(this.apellido, this.correo, this.nombrePersona, this.telefono, this.whatsapp, this.telegram);
}

class _Publicar3PageState extends State<Publicar3Page> {
  var contadorMascotas = 0;
  var contadorFumar = 0;
  String? apellido, correo, nombrePersona, telefono;
  bool? whatsapp, telegram;
  _Publicar3PageState(this.apellido, this.correo, this.nombrePersona,
      this.telefono, this.whatsapp, this.telegram);
  @override
  Widget build(BuildContext context) {
    final publicarInmueble = Provider.of<PublicarProvider>(context);
    final inmueblesService = Provider.of<InmueblesServices>(context);
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
                        Publicar2Page(widget._ubicacionController, apellido, correo, nombrePersona, telefono, whatsapp, telegram)));
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
        child: SingleChildScrollView(
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
                    padding: EdgeInsets.only(top: 30, bottom: 10, left: 30),
                    child: Text(
                      'Descripción del inmueble',
                      style: TextStyle(
                          fontSize: 20,
                          color: utils.Colors.blanco,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: utils.Colors.grisMedio,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      maxLines: 20,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Descripción general del inmueble',
                          iconColor: Color(0xff3A4750),
                          labelStyle: TextStyle(
                              color: Color(0xff3A4750),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      onChanged: (value) =>
                          publicarInmueble.descripcion = value,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
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
                          if(publicarInmueble.tipo == 'apartamento'){
                               inmueblesService.guardarOCrearInmueble(Inmuebles(
                                apellidos: apellido!,
                                area: int.parse(publicarInmueble.area),
                                cantHabitaciones: int.parse(publicarInmueble.habitaciones),
                                cantbanos: int.parse(publicarInmueble.banos),
                                correo: correo!,
                                descripcion: publicarInmueble.descripcion,
                                direccion: publicarInmueble.ubicacion,
                                estrato: int.parse(publicarInmueble.estrato),
                                fotos: '',
                                fumar: publicarInmueble.fumar,
                                internt: publicarInmueble.internt,
                                lavadero: publicarInmueble.lavadero,
                                mascotas: publicarInmueble.mascotas,
                                muebles: publicarInmueble.muebles,
                                nombreInmueble: publicarInmueble.nombre,
                                nombrePersona: nombrePersona!,
                                parqueadero: publicarInmueble.parqueadero,
                                precio: int.parse(publicarInmueble.precio),
                                servicios: publicarInmueble.servicios,
                                telegram: telegram!,
                                tipo: publicarInmueble.tipo,
                                whatsapp: whatsapp!,
                                telefono: int.parse(telefono!),
                                id: 'WBC767'));
                          }else{
                             inmueblesService.guardarOCrearInmueble(Inmuebles(
                                apellidos: apellido!,
                                area: int.parse(publicarInmueble.area),
                                cantHabitaciones: 1,
                                cantbanos: 1,
                                correo: correo!,
                                descripcion: publicarInmueble.descripcion,
                                direccion: publicarInmueble.ubicacion,
                                estrato: 2,
                                fotos: '',
                                fumar: publicarInmueble.fumar,
                                internt: publicarInmueble.internt,
                                lavadero: publicarInmueble.lavadero,
                                mascotas: publicarInmueble.mascotas,
                                muebles: publicarInmueble.muebles,
                                nombreInmueble: publicarInmueble.nombre,
                                nombrePersona: nombrePersona!,
                                parqueadero: publicarInmueble.parqueadero,
                                precio: int.parse(publicarInmueble.precio),
                                servicios: publicarInmueble.servicios,
                                telegram: telegram!,
                                tipo: publicarInmueble.tipo,
                                whatsapp: whatsapp!,
                                telefono: int.parse(telefono!),
                                id: 'WBC403'));
                          }
                           
                            //*Aqui almacenas la info en la base de datos, ya que despues todo se borra

                            publicarInmueble.ubicacion = '';
                            publicarInmueble.nombre = '';
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
                            publicarInmueble.descripcion = '';
                            //*CAMBIAR LO DEL CORREO
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InicioPublicaciones(
                                          correo: ' ',
                                        )));
                          },
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
