import 'package:app_arriendosu/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Inicio_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.ocre,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'home');
            },
            icon: FaIcon(FontAwesomeIcons.arrowLeft),
            iconSize: 20,
            color: Colors.black,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Registrar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 5),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Iniciar',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Container()),
          Container(
            height: 650,
            decoration: BoxDecoration(
                color: utils.Colors.grisClaro,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                _textFieldUsuario(),
                SizedBox(
                  height: 20,
                ),
                _textFieldContrasena(),
                _textContrasena(),
                SizedBox(
                  height: 20,
                ),
                ButtonApp(direccion: 'inicia', texto: 'Iniciar'),
                 SizedBox(
                  height: 50,
                ),
                _buttonConectar('Continuar con google', 'https://storage.googleapis.com/support-kms-prod/ZAl1gIwyUsvfwxoW9ns47iJFioHXODBbIkrK'),
                SizedBox(height: 10,),
                _buttonConectar('Continuar con facebook', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/2048px-Facebook_f_logo_%282019%29.svg.png')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textFieldUsuario() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: utils.Colors.grisMedio,
          borderRadius: BorderRadius.circular(35),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            autocorrect: false,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Nombre de usuario',
                labelText: 'Usuario',
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
                iconColor: Color(0xff3A4750),
                labelStyle: TextStyle(
                    color: Color(0xff3A4750),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            cursorHeight: 20,
            cursorColor: Color(0xff3A4750),
          ),
        ),
      ),
    );
  }

  Widget _textFieldContrasena() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: utils.Colors.grisMedio,
          borderRadius: BorderRadius.circular(35),
          
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                ),
                iconColor: Color(0xff3A4750),
                labelStyle: TextStyle(
                    color: Color(0xff3A4750),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            cursorHeight: 20,
            cursorColor: Color(0xff3A4750),
          ),
        ),
      ),
    );
  }

  Widget _textContrasena() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                '¿Olvido su contraseña?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              )),
        ],
      ),
    );
  }

  Widget _buttonConectar(String texto, String linkImge) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        height: 64,
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(linkImge),
              backgroundColor: Colors.white,
            ),
            Text(texto, style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.arrow_forward_ios_rounded)
            )
          ],
        ),
      ),
    );
  }
}
