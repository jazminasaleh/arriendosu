import 'package:app_arriendosu/src/provider/publicaciones_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

class DescripcionPublicaciones extends StatelessWidget {
  const DescripcionPublicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>new SliderModel(),
      child: Scaffold(
          backgroundColor: utils.Colors.fondoOscuro,
          appBar: AppBar(),
          body: Center(
              child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: _Slides(),
              ),
              _Dots()
            ],
          ))),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(
            index: 0,
          ),
          _Dot(
            index: 1,
          ),
          _Dot(
            index: 2,
          )
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(
            color: (pageViewIndex == index) ? utils.Colors.ocre : utils.Colors.grisClaro, 
            shape: BoxShape.circle
          ),
    );
  }
}

class _Slides extends StatefulWidget {
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
        children: [
          _slide(
            img: 'assets/publicaciones/pub1.jpg',
          ),
          Image.asset('assets/publicaciones/pub2.jpg'),
          Image.asset('assets/publicaciones/pub3.jpg'),
        ],
      ),
    );
  }
}

class _slide extends StatelessWidget {
  final String img;

  const _slide({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(img),
    );
  }
}
