
import 'package:app_arriendosu/src/pages/publicaciones/menu/opciones_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import '../../login/login.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 163, 161, 161),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/menu/foto.jpg'),
                ),
              ),
              Text(
                'Andrea Peña',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: utils.Colors.ocre,
              ),
              Expanded(child: ListaOpciones()),
             
               SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inicio_Page()));
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   gradient: new LinearGradient(
                    colors: [
                      Color(0xFFFF422C),
                      Color(0xFFFF9003),
                    ],
                    begin: Alignment.centerLeft,
                    end:  Alignment.centerRight
                    )
                  ),
                  child: Center(
                    child: Text('Salir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  )
                ),
              ),
               SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}


class ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageOpcionesMenu[i].icon,
          size: 30,
          color: utils.Colors.ocre,
        ),
        title: Text(
          pageOpcionesMenu[i].titulo,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => pageOpcionesMenu[i].page));
        },
      ),
      separatorBuilder: (context, i) =>
          Divider(color: Color.fromARGB(255, 163, 161, 161)),
      itemCount: pageOpcionesMenu.length,
    );
  }
}

