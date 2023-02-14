import 'package:flutter/material.dart';

import '../../widgets/slidesShow.dart';



class DescripcionPublicaciones extends StatelessWidget {
  const DescripcionPublicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidesShow(slides: [
        Image.asset('assets/publicaciones/pub2.jpg'),
        Image.asset('assets/publicaciones/pub3.jpg'),
        Image.asset('assets/publicaciones/pub1.jpg'),
      ],)
    );
  }
}
