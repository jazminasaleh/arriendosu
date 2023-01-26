import 'package:app_arriendosu/src/pages/login/home_page.dart';
import 'package:app_arriendosu/src/pages/publicaciones/listas_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.azulOscuro,
      appBar: AppBar(
        //qleading: Text(''),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Icon(
                Icons.home_work_rounded,
                color: utils.Colors.ocre,
                size: 35,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Perfil',
                style: TextStyle(
                    fontSize: 25,
                    color: utils.Colors.blanco,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 200,
                  width: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/perfil/foto.jpg'),
                    radius: 50,
                  ),
                ),
              ),
              Positioned(
                  bottom: 15,
                  right: 10,
                  child: Icon(
                    Icons.circle,
                    size: 45,
                    color: utils.Colors.ocre,
                  )),
              Positioned(
                  bottom: 143,
                  right: 10,
                  child: 
                  IconButton(
                    icon:
                        Icon(Icons.edit, size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_Page()));
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
