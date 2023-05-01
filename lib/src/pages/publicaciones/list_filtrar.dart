import 'package:app_arriendosu/src/pages/publicaciones/actualizarPublicacion.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import '../../widgets/slidesShow.dart';

//*Pagina de listas ya sea de favoritos o de sugernecias
class ListaMisFiltros extends StatelessWidget {
  final String titulo;
  final bool editar;
  String correoo;
  List slides, misImagenes;

  ListaMisFiltros(
      {super.key,
      required this.titulo,
      required this.editar,
      required this.correoo,
      required this.slides,
      required this.misImagenes});

  @override
  Widget build(BuildContext context) {
   
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
                  itemCount: slides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SidesShow(
                                    slides: misImagenes[index].imagenes,
                                    direccion: slides[index].direccion,
                                    barrio: slides[index].nombreInmueble,
                                    precio: slides[index].precio
                                        .toString(),
                                    descripcion: slides[index].descripcion,
                                    apellidosArrendador: slides[index].apellidos,
                                    area:
                                       slides[index].area,
                                    correo: slides[index].correo,
                                    estrato: slides[index].estrato,
                                    fumar:
                                        slides[index].fumar,
                                    internt: slides[index].internt,
                                    lavadero: slides[index].lavadero,
                                    mascotas: slides[index].mascotas,
                                    muebles: slides[index].muebles,
                                    nombreArrendador:slides[index].nombrePersona,
                                    parqueadero: slides[index].parqueadero,
                                    servicios: slides[index].servicios,
                                    telefonoArrendador: slides[index].telefono
                                        .toString(),
                                    telegram: slides[index].telegram,
                                    whatsapp: slides[index].whatsapp,
                                    tipo:
                                        slides[index].tipo,
                                    cantBanos: slides[index].cantbanos,
                                    cantHabitaciones: slides[index].cantHabitaciones,
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
                                        image: AssetImage(misImagenes[index].iamgen),
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
                                      slides[index].direccion,
                                      style: const TextStyle(
                                          color: utils.Colors.blanco,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                                  Text(
                                    slides[index].nombreInmueble,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: utils.Colors.blanco),
                                  ),
                                  Text(
                                    '\$${slides[index].precio}',
                                    style: const TextStyle(
                                        color: utils.Colors.ocre,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
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
