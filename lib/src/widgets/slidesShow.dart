import 'package:app_arriendosu/src/models/inmuebles.dart';
import 'package:app_arriendosu/src/pages/publicaciones/descripcion_publicaciones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import '../provider/publicaciones_slider.dart';
import '../services/inmuebles_services.dart';

//*slider de imagnes de la pagina descripcion de publicaciones
class SidesShow extends StatelessWidget {
  final InmueblesServices listaInmuebles;
  //*datos generlaes del inmueble
  List<Widget>? slides;
  String direccion;
  String barrio;
  String precio;
  String descripcion;
  String tipo;
  //*datos de los detalles
  bool internt;
  bool servicios;
  bool parqueadero;
  bool muebles;
  bool lavadero;
  int area;
  int cantHabitaciones;
  int cantBanos;
  int estrato;
  //*restricciones
  bool mascotas;
  bool fumar;
  //*datos del arrendador
  String nombreArrendador;
  String apellidosArrendador;
  String telefonoArrendador;
  String correo;
  bool telegram;
  bool whatsapp;

  SidesShow(
      {
      required this.listaInmuebles,
      this.slides,
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
      required this.area,
      required this.cantHabitaciones,
      required this.cantBanos,
      required this.estrato,
      required this.mascotas,
      required this.fumar,
      required this.nombreArrendador,
      required this.apellidosArrendador,
      required this.telefonoArrendador,
      required this.correo,
      required this.telegram,
      required this.whatsapp
      
    });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
          backgroundColor: utils.Colors.fondoOscuro,
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: _Slides(
                    slides: listaInmuebles.inmuebles,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: _Dots(
                    totalSlides: this.listaInmuebles.inmuebles.length,
                  ),
                ),
                DescripcionPublicaciones(
                  direccion: direccion,
                  barrio: barrio,
                  precio: precio,
                  slides: listaInmuebles.inmuebles,
                  descripcion: descripcion, 
                  apellidoArrendador: apellidosArrendador,
                  nombreArrendador: nombreArrendador,
                  telefonoArrendador: telefonoArrendador,
                  correo: correo,
                  telegram: telegram,
                  whatsapp: whatsapp,
                  fumar: fumar, 
                  internt: internt, 
                  lavadero: lavadero, 
                  mascotas: mascotas, 
                  muebles: muebles, 
                  parqueadero: parqueadero, 
                  servicios: servicios, 
                  tipo: tipo,
                  cantHbaitaciones: cantHabitaciones.toString(),
                  cantbanos: cantBanos.toString(), 
                  estrato: estrato.toString(),
                )
              ],
            ),
          )),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots({super.key, required this.totalSlides});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(this.totalSlides, (index) => _Dot(index: index)),
      ),
    );
  }
}

//*uno de los punticos
class _Dot extends StatelessWidget {
  final int index;

  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? utils.Colors.ocre
              : utils.Colors.grisClaro,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List slides;

  const _Slides({required this.slides});
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _slide extends StatelessWidget {
  final Widget slide;

  const _slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, height: double.infinity, child: slide);
  }
}
