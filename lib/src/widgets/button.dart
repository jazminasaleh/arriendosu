import 'package:flutter/material.dart';
//*Boton que se usa en todo el loguin 
//*ejemplo en iniciar 
class ButtonApp extends StatelessWidget {
  String direccion;
  String texto;
  Function onpress;

  ButtonApp(
      {required this.onpress, required this.direccion, required this.texto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress();
        Navigator.popAndPushNamed(context, direccion);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35),
        ),
        height: 64,
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
