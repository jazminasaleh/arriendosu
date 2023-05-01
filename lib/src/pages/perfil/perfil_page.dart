import 'dart:io';

import 'package:app_arriendosu/src/pages/login/inicio_page.dart';
import 'package:app_arriendosu/src/pages/perfil/editar_perfil_page.dart';
import 'package:app_arriendosu/src/pages/publicar/publicar1.dart';
import 'package:app_arriendosu/src/pages/ubicacion/pagina_ubicacion.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../services/usuarios_services.dart';

//* Pagina de perfil, donde muestra el menu de opciones
//*editar perfil, ubicacion, publicar y salir

class PerfilPage extends StatefulWidget {
  String? correo, nombre, apellidos, telefono;
  bool? telegram, whatsapp;

  PerfilPage(
      {this.correo,
      this.nombre,
      this.apellidos,
      this.telefono,
      this.telegram,
      this.whatsapp});
  @override
  State<PerfilPage> createState() => _PerfilPageState(
      correo: correo!,
      nombre: nombre,
      apellidos: apellidos,
      telefono: telefono,
      whatsapp: whatsapp,
      telegram: telegram);
}

class _PerfilPageState extends State<PerfilPage> {
  File? imagen;
  final picker = ImagePicker();
  String? correo, nombre, apellidos, telefono;
  bool? telegram, whatsapp;
  UsuariosServices? usuariosServices;
  _PerfilPageState(
      {this.correo,
      this.nombre,
      this.apellidos,
      this.telefono,
      this.telegram,
      this.whatsapp});
  Future selImagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        //usuariosServices!.updateSelectUserImage(pickedFile.path);
        print(' tenemos imagen $imagen');
      } else {
        print('No se selecciono ninguna imagen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    usuariosServices = Provider.of<UsuariosServices>(context);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InicioPublicaciones(
                            correo: correo,
                          )));
            }),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: const [
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
      //*poder subir una iamgen o modificar la imagen
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              color: utils.Colors.fondoOscuro,
                              borderRadius: BorderRadius.circular(30)),
                          child: CircleAvatar(
                            backgroundColor: utils.Colors.fondoOscuro,
                            child: imagen == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/perfil/foto.jpg',
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(imagen!),
                                  ),
                          )),
                    ),
                    const Positioned(
                        bottom: -4,
                        right: 10,
                        child: Icon(
                          Icons.circle,
                          size: 45,
                          color: utils.Colors.ocre,
                        )),
                    Positioned(
                        bottom: -5,
                        right: 10,
                        child: IconButton(
                            icon: const Icon(Icons.mode_edit_rounded,
                                size: 30, color: Colors.black),
                            onPressed: () {
                              opciones(context);
                            })),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                nombre!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: utils.Colors.blanco),
              ),
              Text(
                correo!,
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
              //*opciones del menu del perfil, como editar perfil, ubicacion  y publicar
              _menuPerfilEditar(
                iconoItem: Icons.account_circle_outlined,
                nomItem: 'Editar Perfil',
                correo: correo!,
                apellidos: apellidos!,
                nombre: nombre!,
                telefono: telefono!,
                telegram: telegram!,
                whatsapp: whatsapp!,
              ),
              _menuPerfilUbicacion(
                iconoItem: Icons.map_outlined,
                nomItem: 'Ubicación',
                correo: correo!,
              ),
              _menuPerfilPublicar(
                iconoItem: Icons.photo_camera_back_sharp,
                nomItem: 'Publicar',
                correo: correo!,
                apellido: apellidos!,
                nombrePersona: nombre!,
                telefono: telefono!,
                telegram: telegram!,
                whatsapp: whatsapp!,
              ),
              _menuPerfilCerrar(
                iconoItem: Icons.logout_outlined,
                nomItem: 'Cerrar sesión',
                color: utils.Colors.rojo,
              )
            ]),
          ),
        ),
      ),
    );
  }

//*el cuadro que sale caundo se desea editar la imagen del jusuario
//*sale la opcion de tomar foto o una de la galeria
  void opciones(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: utils.Colors.ocre,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Seleccionar una foto',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: utils.Colors.ocre,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: utils.Colors.rojo,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: utils.Colors.blanco),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

//*Menu del perfil
//*recibe cada uno el titulo, el icono y la direccion
class _menuPerfilEditar extends StatelessWidget {
  String nomItem, correo;
  IconData iconoItem;
  Color color;
  String? nombre, apellidos, telefono;
  bool? telegram, whatsapp;
  _menuPerfilEditar(
      {required this.nomItem,
      required this.iconoItem,
      required this.correo,
      this.color = utils.Colors.blanco,
      this.nombre,
      this.apellidos,
      this.telefono,
      this.telegram,
      this.whatsapp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditarPerfilPage(
                      correo: correo,
                      apellidos: apellidos,
                      nombre: nombre,
                      telefono: telefono,
                      telegram: telegram,
                      whatsapp: whatsapp,
                      mesnaje: '',
                    )));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconoItem,
                color: color,
                size: 40,
              ),
              const SizedBox(
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

class _menuPerfilUbicacion extends StatelessWidget {
  String nomItem;
  IconData iconoItem;
  Color color;
  String correo;
  _menuPerfilUbicacion(
      {required this.nomItem,
      required this.iconoItem,
      required this.correo,
      this.color = utils.Colors.blanco});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UbicacionPage(
                      correo: correo,
                    )));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconoItem,
                color: color,
                size: 40,
              ),
              const SizedBox(
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

class _menuPerfilPublicar extends StatelessWidget {
  String nomItem;
  IconData iconoItem;
  Color color;
  String apellido, correo, nombrePersona, telefono;
  bool whatsapp, telegram;

  _menuPerfilPublicar({
    required this.nomItem,
    required this.iconoItem,
    required this.correo,
    this.color = utils.Colors.blanco,
    required this.apellido,
    required this.nombrePersona,
    required this.telefono,
    required this.whatsapp,
    required this.telegram,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('este es el telefono $nombrePersona');
        if (telefono == '' || nombrePersona == 'Sin nombre') {
           Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditarPerfilPage(apellidos: apellido,correo: correo,mesnaje: 'Por fvaor digitar esta infromación antes de hacer la publicación de un inmueble',nombre: nombrePersona,telefono: telefono,telegram: telegram,whatsapp: whatsapp,)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Publicar1Pagr(
                        correo: correo,
                        apellido: apellido,
                        nombrePersona: nombrePersona,
                        telefono: telefono,
                        whatsapp: whatsapp,
                        telegram: telegram,
                      )));
        }
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconoItem,
                color: color,
                size: 40,
              ),
              const SizedBox(
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

class _menuPerfilCerrar extends StatelessWidget {
  String nomItem;
  IconData iconoItem;
  Color color;

  _menuPerfilCerrar({
    required this.nomItem,
    required this.iconoItem,
    this.color = utils.Colors.blanco,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Inicio_Page()));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconoItem,
                color: color,
                size: 40,
              ),
              const SizedBox(
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
