import 'package:app_arriendosu/src/pages/perfil/editar_perfil_page.dart';
import 'package:app_arriendosu/src/pages/ubicacion/pagina_ubicacion.dart';
import 'package:flutter/material.dart';


import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//* Pagina de perfil, donde muestra el menu de opciones
//*editar perfil, ubicacion, publicar y salir
class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
             Navigator.push(context,MaterialPageRoute(
                builder: (context) => InicioPublicaciones()
            ));
          }
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: const[
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 200,
                        width: 150,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/perfil/foto.jpg'),
                          radius: 50,
                        ),
                      ),
                    ),
                    const Positioned(
                        bottom: 15,
                        right: 10,
                        child: Icon(
                          Icons.circle,
                          size: 45,
                          color: utils.Colors.ocre,
                        )),
                    Positioned(
                        bottom: 18,
                        right: 12,
                        child: IconButton(
                          icon: const Icon(Icons.mode_edit_rounded,
                              size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditarPerfilPage()
                                )
                            );
                          },
                        )
                      ),
                  ],
                ),
              ),
              const Text(
                'Jasmin Saleh',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: utils.Colors.blanco),
              ),
              const Text(
                'jaminsaleh@uptc.edu.co',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: utils.Colors.blanco),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 2,
                  color: utils.Colors.azulOscuro,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _menuPerfil(
                iconoItem: Icons.account_circle_outlined,
                nomItem: 'Editar Perfil',
                onPress: 'editarperfil',
              ),
              _menuPerfil(
                iconoItem: Icons.map_outlined,
                nomItem: 'Ubicación',
                onPress: 'ubicacion',
              ),
              _menuPerfil(
                iconoItem: Icons.photo_camera_back_sharp,
                nomItem: 'Publicar',
                onPress: '',
              ),
              _menuPerfil(
                iconoItem: Icons.logout_outlined,
                nomItem: 'Salir',
                onPress: 'inicio',
                color: utils.Colors.rojo,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

//*Menu del perfil
class _menuPerfil extends StatelessWidget {
  String nomItem;
  IconData iconoItem;
  String onPress;
  Color color;
  _menuPerfil(
      {required this.nomItem, required this.iconoItem, required this.onPress, this.color = utils.Colors.blanco});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, onPress);
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconoItem,
                color: color,
                size: 40,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                nomItem,
                style: TextStyle(color: color, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
