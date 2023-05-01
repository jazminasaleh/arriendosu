import 'package:app_arriendosu/src/pages/publicaciones/actualizarPublicacion.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../services/inmuebles_services.dart';
import '../../widgets/slidesShow.dart';

//*Pagina de listas ya sea de favoritos o de sugernecias
class ListasPage extends StatelessWidget {
  final String titulo;
  final bool editar;
  String correoo;
  List slides;

  ListasPage(
      {super.key,
      required this.titulo,
      required this.editar,
      required this.correoo,
      required this.slides});

  @override
  Widget build(BuildContext context) {
    final inmuebleServices = Provider.of<InmueblesServices>(context);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            print('El correo que va de listas page es $correoo');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InicioPublicaciones(
                        correo: correoo,
                      )),
            );
          },
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: inmuebleServices.inmuebles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SidesShow(
                                    slides: slides[index].imagenes,
                                    direccion: inmuebleServices
                                        .inmuebles[index].direccion,
                                    barrio: inmuebleServices
                                        .inmuebles[index].nombreInmueble,
                                    precio: inmuebleServices
                                        .inmuebles[index].precio
                                        .toString(),
                                    descripcion: inmuebleServices
                                        .inmuebles[index].descripcion,
                                    listaInmuebles: inmuebleServices,
                                    apellidosArrendador: inmuebleServices
                                        .inmuebles[index].apellidos,
                                    area:
                                        inmuebleServices.inmuebles[index].area,
                                    correo: inmuebleServices
                                        .inmuebles[index].correo,
                                    estrato: inmuebleServices
                                        .inmuebles[index].estrato,
                                    fumar:
                                        inmuebleServices.inmuebles[index].fumar,
                                    internt: inmuebleServices
                                        .inmuebles[index].internt,
                                    lavadero: inmuebleServices
                                        .inmuebles[index].lavadero,
                                    mascotas: inmuebleServices
                                        .inmuebles[index].mascotas,
                                    muebles: inmuebleServices
                                        .inmuebles[index].muebles,
                                    nombreArrendador: inmuebleServices
                                        .inmuebles[index].nombrePersona,
                                    parqueadero: inmuebleServices
                                        .inmuebles[index].parqueadero,
                                    servicios: inmuebleServices
                                        .inmuebles[index].servicios,
                                    telefonoArrendador: inmuebleServices
                                        .inmuebles[index].telefono
                                        .toString(),
                                    telegram: inmuebleServices
                                        .inmuebles[index].telegram,
                                    whatsapp: inmuebleServices
                                        .inmuebles[index].whatsapp,
                                    tipo:
                                        inmuebleServices.inmuebles[index].tipo,
                                    cantBanos: inmuebleServices
                                        .inmuebles[index].cantbanos,
                                    cantHabitaciones: inmuebleServices
                                        .inmuebles[index].cantHabitaciones,
                                  )),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.80,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: utils.Colors.azulOscuro,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        opacity: 0.50,
                                        image: AssetImage(slides[index].iamgen),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(children: [
                                    Text(
                                      inmuebleServices
                                          .inmuebles[index].direccion,
                                      style: const TextStyle(
                                          color: utils.Colors.blanco,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                                  Text(
                                    inmuebleServices
                                        .inmuebles[index].nombreInmueble,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: utils.Colors.blanco),
                                  ),
                                  Text(
                                    '\$${inmuebleServices.inmuebles[index].precio}',
                                    style: const TextStyle(
                                        color: utils.Colors.ocre,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActualizarInmueblePage(
                                                        id: inmuebleServices
                                                            .inmuebles[index].id
                                                            .toString(),
                                                        area: inmuebleServices
                                                            .inmuebles[index]
                                                            .area
                                                            .toString(),
                                                        direccion:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .direccion,
                                                        barrio: inmuebleServices
                                                            .inmuebles[index]
                                                            .nombreInmueble,
                                                        precio: inmuebleServices
                                                            .inmuebles[index]
                                                            .precio
                                                            .toString(),
                                                        descripcion:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .descripcion,
                                                        apellidoArrendador:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .apellidos,
                                                        correo: inmuebleServices
                                                            .inmuebles[index]
                                                            .correo,
                                                        estrato:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .estrato
                                                                .toString(),
                                                        fumar: inmuebleServices
                                                            .inmuebles[index]
                                                            .fumar,
                                                        internt:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .internt,
                                                        lavadero:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .lavadero,
                                                        mascotas:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .mascotas,
                                                        muebles:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .muebles,
                                                        nombreArrendador:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .nombrePersona,
                                                        parqueadero:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .parqueadero,
                                                        servicios:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .servicios,
                                                        telefonoArrendador:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .telefono
                                                                .toString(),
                                                        telegram:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .telegram,
                                                        tipo: inmuebleServices
                                                            .inmuebles[index]
                                                            .tipo,
                                                        whatsapp:
                                                            inmuebleServices
                                                                .inmuebles[
                                                                    index]
                                                                .whatsapp,
                                                      )),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.pending_actions_outlined,
                                            color: utils.Colors.ocre,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
