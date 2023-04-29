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
  List<Widget> ?slides;
  String direccion;
  String barrio;
  int precio;
  List ?iconosDetalles;
  List ?nombreDeatlles;
  List ?iconosRestricciones;
  List ?nombreRestricciones;
  String descripcion;
  SidesShow(
      {
      required this.listaInmuebles,
      this.slides,
      required this.direccion,
      required this.barrio,
      required this.precio,
      this.iconosDetalles,
      this.nombreDeatlles,
      this.iconosRestricciones,
      this.nombreRestricciones,
      required this.descripcion});

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
                  precio: precio.toString(),
                  slides: listaInmuebles.inmuebles,
                  iconosDetalles: iconosDetalles!,
                  nombreDeatlles: nombreDeatlles!,
                  iconosRestricciones: iconosRestricciones!,
                  nombreRestricciones: nombreRestricciones!,
                  descripcion: descripcion,
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
