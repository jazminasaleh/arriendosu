import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/widgets/button.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

//*Pagina para que el usuario pueda editar su perfil
//*Editar datos como nombre, apellido, correo y telefono
class EditarPerfilPage extends StatefulWidget {
  bool whatsapp = false;
  bool telegram = true;
  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  EditarPerfilController _editarController = new EditarPerfilController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(context,MaterialPageRoute(
                builder: (context) => PerfilPage()
            ));
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
                    _formTextField(),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonApp(
                        onpress: _editarController.datosUsuario,
                        direccion: 'perfil',
                        texto: 'Guardar'),
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
  Widget _formTextField() {
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
                child: _textFieldNombre(),
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
                child: _textFieldApellido(),
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
                child: _textFieldCorreo(),
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
                          horizontal: 20, vertical: 30
                      ),
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: utils.Colors.grisMedio,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _textFieldTelefono(),
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
                                children: const[
                                  Icon(Icons.whatsapp_outlined, size: 30, color: utils.Colors.blanco,),
                                  SizedBox(width: 5,),
                                  Text('whatsApp', style: TextStyle(fontSize: 25, color: utils.Colors.blanco),),
                                ],
                              ),
                              Switch(
                                activeColor: utils.Colors.blanco,
                                activeTrackColor: utils.Colors.ocre,
                                value: widget.whatsapp,
                                onChanged: (value) {
                                  setState(() {
                                    (value)
                                      ? widget.whatsapp = value
                                      : widget.whatsapp = value;
                                  });
                                }
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const[
                                  Icon(Icons.telegram, size: 30, color: utils.Colors.blanco,),
                                  SizedBox(width: 5,),
                                   Text('Telegram', style: TextStyle(fontSize: 25, color: utils.Colors.blanco),),
                                ],
                              ),
                              Switch(
                                activeColor: utils.Colors.blanco,
                                activeTrackColor: utils.Colors.ocre,
                                value: widget.telegram,
                                onChanged: (value) {
                                  setState(() {
                                    (value)
                                      ? widget.telegram = value
                                      : widget.telegram = value;
                                  });
                                }
                              )
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
        )
      );
  }
//*Textfield del nombre del usuario
  TextFormField _textFieldNombre() {
    return TextFormField(
      controller: _editarController.nombreController,
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
    );
  }
 //*Textfield del apellido del usuario
  TextFormField _textFieldApellido() {
    return TextFormField(
      controller: _editarController.apellidoController,
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
    );
  }

//*Textfield del correo del usuario
  TextFormField _textFieldCorreo() {
    return TextFormField(
      controller: _editarController.correoController,
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
    );
  }

//*Textfield del telefono del usuario
  TextFormField _textFieldTelefono() {
    return TextFormField(
      controller: _editarController.telefonoController,
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
    );
  }
}
