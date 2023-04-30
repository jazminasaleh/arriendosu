import 'package:app_arriendosu/src/models/usuarios.dart';
import 'package:app_arriendosu/src/pages/publicaciones/inicio_publicaciones_page.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/widgets/button.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../services/usuarios_services.dart';

//*Pagina para que el usuario pueda editar su perfil
//*Editar datos como nombre, apellido, correo y telefono
class EditarPerfilPage extends StatefulWidget {
  String? correo;
  String? nombre, apellidos, telefono;
  bool? telegram, whatsapp;

  EditarPerfilPage(
      {this.correo,
      this.nombre,
      this.apellidos,
      this.telefono,
      this.telegram,
      this.whatsapp});
  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState(
      correo: correo,
      nombre: nombre,
      apellidos: apellidos,
      telefono: telefono,
      telegram: telegram,
      whatsapp: whatsapp);
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  EditarPerfilController _editarController = new EditarPerfilController();
  String? correo;
  String? nombre, apellidos, telefono;
  bool? telegram, whatsapp;
  int contadorbtn = 0;
  bool validNombre = false, validApellidos = false, validTel = false;
  _EditarPerfilPageState(
      {this.correo,
      this.nombre,
      this.apellidos,
      this.telefono,
      this.telegram,
      this.whatsapp});
  @override
  Widget build(BuildContext context) {
    final usuariosServices = Provider.of<UsuariosServices>(context);
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
          },
        ),
        title: const Text('Editar perfil'),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    _formTextField(nombre!, apellidos!, correo!, telefono!),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          disabledColor: utils.Colors.grisOscuro,
                          elevation: 0,
                          color: utils.Colors.ocre,
                          height: 60,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              child: const Text(
                                'Actualizar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25),
                                textAlign: TextAlign.center,
                              )),
                          onPressed: usuariosServices.isLoading
                              ? null
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  contadorbtn = 0;
                                  if (nombre != '') {
                                    contadorbtn++;
                                    validNombre = false;
                                  } else {
                                    validNombre = true;
                                    validacionNombre(validNombre);
                                  }

                                  if (apellidos != '') {
                                    contadorbtn++;
                                    validApellidos = false;
                                  } else {
                                    validApellidos = true;
                                    validacionApellidos(validApellidos);
                                  }

                                  if (telefono != '') {
                                    validTel = false;
                                    contadorbtn++;
                                  } else {
                                    validTel = true;
                                    validacionTelefono(validTel);
                                  }

                                  if (contadorbtn >= 3) {
                                    contadorbtn = 0;
                                    usuariosServices.isLoading = true;
                                    usuariosServices.guardarOCrearUsuarios(
                                        Usuarios(
                                            apellidos: apellidos!,
                                            correo: correo!,
                                            foto: '',
                                            nombre: nombre!,
                                            telefono: int.parse(telefono!),
                                            telegram: telegram!,
                                            whatsapp: whatsapp!));
                                    usuariosServices.isLoading = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InicioPublicaciones(
                                                correo: correo,
                                              )),
                                    );
                                  } else {
                                    usuariosServices.isLoading = false;
                                  }
                                },
                        )),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//*Formulario para digitar la infromacion para editar el perfil
  Widget _formTextField(
      String nombre, String apellido, String correo, String telefono) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _textFieldNombre(nombre),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _textFieldApellido(apellido),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: utils.Colors.grisMedio,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.email,
                        color: utils.Colors.grisOscuro,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          correo,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: utils.Colors.azulOscuro,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: utils.Colors.grisMedio,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _textFieldTelefono(telefono),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.whatsapp_outlined,
                                    size: 30,
                                    color: utils.Colors.blanco,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'whatsApp',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: utils.Colors.blanco),
                                  ),
                                ],
                              ),
                              Switch(
                                  activeColor: utils.Colors.blanco,
                                  activeTrackColor: utils.Colors.ocre,
                                  value: widget.whatsapp!,
                                  onChanged: (value) {
                                    setState(() {
                                      (value)
                                          ? widget.whatsapp = value
                                          : widget.whatsapp = value;
                                    });
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.telegram,
                                    size: 30,
                                    color: utils.Colors.blanco,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Telegram',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: utils.Colors.blanco),
                                  ),
                                ],
                              ),
                              Switch(
                                  activeColor: utils.Colors.blanco,
                                  activeTrackColor: utils.Colors.ocre,
                                  value: widget.telegram!,
                                  onChanged: (value) {
                                    setState(() {
                                      (value)
                                          ? widget.telegram = value
                                          : widget.telegram = value;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

//*Textfield del nombre del usuario
  TextFormField _textFieldNombre(String nombre) {
    return TextFormField(
      initialValue: nombre,
      autocorrect: false,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Nombre de usuario',
          labelText: 'Nombre',
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
      onChanged: (value) => nombre = value,
    );
  }

  //*Textfield del apellido del usuario
  TextFormField _textFieldApellido(String apellido) {
    return TextFormField(
      initialValue: apellidos,
      autocorrect: false,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Sus apellidos',
          labelText: 'Apellidos',
          prefixIcon: Icon(
            Icons.person_outline_sharp,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => apellidos = value,
    );
  }

//*Textfield del correo del usuario
  TextFormField _textFieldCorreo(String correo) {
    return TextFormField(
      initialValue: correo,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Correo electronico',
          labelText: 'Correo',
          prefixIcon: Icon(
            Icons.email,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 20,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) => correo = value,
    );
  }

//*Textfield del telefono del usuario
  TextFormField _textFieldTelefono(String telefono) {
    return TextFormField(
      initialValue: telefono,
      autocorrect: false,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Número de teléfono',
          labelText: 'Teléfono',
          prefixIcon: Icon(
            Icons.phone,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 15,
      cursorColor: const Color(0xff3A4750),
      onChanged: (value) => telefono = value,
    );
  }

  Widget validacionNombre(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es un nombre' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget validacionApellidos(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es un apellido' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget validacionTelefono(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          validacion ? 'El valor ingresado no es un telefono' : '',
          style: const TextStyle(color: utils.Colors.rojo),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ));
  }
}
