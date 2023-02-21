import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_arriendosu/src/utils/colors.dart' as utils;

import 'package:app_arriendosu/src/pages/login/login.dart';
import 'package:provider/provider.dart';

import '../../provider/login_form_provider.dart';
//*Pagina para poder asignar una nueva contraseña
class NuevaContrasenaPage extends StatelessWidget {
  String correo;
  NuevaContrasenaPage({required this.correo});
  NuevaContrasenaController _contrasenaController = new NuevaContrasenaController();
  bool validacionContrasegna = false;
  bool validacionConfirmarContrasegna = false;
  bool validacionContrasegnas = false;
  int contador = 0;
  static GlobalKey<FormState> formKeyContrasena = new GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFromProvider>(context);
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'olvidoContrasena');
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          iconSize: 20,
          color: utils.Colors.blanco,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'inicio');
              },
              child: const Text(
                'Iniciar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: utils.Colors.blanco
                ),
              )
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
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
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text(
                        'Nueva contraseña',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold, color: utils.Colors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 700,
                decoration: const BoxDecoration(
                  color: utils.Colors.azulOscuro,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: utils.Colors.grisMedio,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.email, color: Colors.black, size: 30,),
                              Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(correo, style: TextStyle(color: Colors.black,  fontSize: 20,
                                    fontWeight: FontWeight.w600),),
                            )],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: formKeyContrasena,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35),
                              child: Container(
                                height: 64,
                                decoration: BoxDecoration(
                                  color: utils.Colors.grisMedio,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: _textFieldCodigo(),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35),
                              child: Container(
                                height: 64,
                                decoration: BoxDecoration(
                                  color: utils.Colors.grisMedio,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: _textFieldContrasena(loginForm),
                              ),
                            ),
                            validacionContrasena(validacionContrasegna),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35),
                              child: Container(
                                height: 64,
                                decoration: BoxDecoration(
                                  color: utils.Colors.grisMedio,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: _textFieldContrasena2(loginForm),
                              ),
                            ),
                            validacionConfirmarContrasena(validacionConfirmarContrasegna),
                            SizedBox(height: 10,),
                            validacionContrasenas(validacionContrasegnas)
                          ],
                        )
                      ),
                    const SizedBox(
                      height: 80,
                    ),
                   MaterialButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                disabledColor: utils.Colors.grisOscuro,
                elevation: 0,
                color: utils.Colors.ocre,
                height: 60,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Iniciar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                    onPressed: loginForm.isLoading
                      ?null
                      :()async{
                        contador = 0;
                         FocusScope.of(context).unfocus();
                         String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = new RegExp(pattern);
                        if(regExp.hasMatch(loginForm.contrasena ?? '') && loginForm.contrasena != ''){
                          validacionContrasegna = false;
                          contador++;
                        }else{
                          validacionContrasegna = true;
                        }
                         if(regExp.hasMatch(loginForm.verificarContrasena ?? '') && loginForm.verificarContrasena != ''){
                          contador++;
                          validacionConfirmarContrasegna = false;
                        }else{
                          validacionConfirmarContrasegna = true;
                        }
                        if(loginForm.contrasena == loginForm.verificarContrasena){
                          contador++;
                          validacionContrasegnas = false;
                        }else{
                          validacionContrasegnas = true;
                        }
                        if(contador>=3){
                          validacionContrasegna=false;
                          validacionContrasegnas=false;
                          validacionConfirmarContrasegna=false;
                          formKeyContrasena.currentState?.validate() ?? false;
                          loginForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 1));
                          loginForm.isLoading = false;
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inicio_Page()),
                                  );
                        }
                      }
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
  TextFormField _textFieldCodigo() {
    return TextFormField(
      controller: _contrasenaController.codigoController,
      autocorrect: false,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Código verificación',
          prefixIcon: Icon(
            Icons.password,
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

  TextFormField _textFieldContrasena(LoginFromProvider loginFromProvider) {
    return TextFormField(
      controller: _contrasenaController.passwordController,
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: InputBorder.none,
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
      cursorHeight: 15,
      cursorColor: Color(0xff3A4750),
      onChanged: (value)=> loginFromProvider.contrasena = value,
    );
  }

  TextFormField _textFieldContrasena2(LoginFromProvider loginFromProvider) {
    return TextFormField(
      controller: _contrasenaController.confirmarPasswordController,
      autocorrect: false,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Confirmar Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            size: 30,
          ),
          iconColor: Color(0xff3A4750),
          labelStyle: TextStyle(
              color: Color(0xff3A4750),
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cursorHeight: 15,
      cursorColor: Color(0xff3A4750),
      onChanged: (value) =>loginFromProvider.verificarContrasena = value,
     
    );
  }

  Widget validacionContrasena(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(
            validacion ? 'El valor ingresado no luce como una contraseña' : '',
            style: TextStyle(color: utils.Colors.rojo),
          ),
      ],
    ));
  }
  Widget validacionConfirmarContrasena(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(
            validacion ? 'El valor ingresado no luce como una contraseña' : '',
            style: TextStyle(color: utils.Colors.rojo),
          ),
      ],
    ));
  }
  Widget validacionContrasenas(bool validacion) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(
            validacion ? 'Las dos contraseñas no estan iguales' : '',
            style: TextStyle(color: utils.Colors.rojo),
          ),
      ],
    ));
  }
}
