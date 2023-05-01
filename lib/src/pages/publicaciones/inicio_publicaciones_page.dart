import 'package:app_arriendosu/src/pages/publicaciones/misPublicaciones.dart';
import 'package:app_arriendosu/src/services/inmuebles_services.dart';
import 'package:app_arriendosu/src/services/usuarios_services.dart';
import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;
import 'package:provider/provider.dart';

import '../../widgets/slidesShow.dart';

//*Pagina donde muestra las publicaciones de sugerencia y guardadas
class InicioPublicaciones extends StatelessWidget {
  String? correo;
  InicioPublicaciones({this.correo});
  @override
  Widget build(BuildContext context) {
    ListaLlenaFavoritos listaFavoritos = new ListaLlenaFavoritos();
    ListaLlenaSugerencias listaSugerncias = new ListaLlenaSugerencias();
    final inmuebleServices = Provider.of<InmueblesServices>(context);
    List misPublicaciones = [], imagnesMispublicaciones = [];
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      appBar: AppBar(
        leading: const SizedBox(),
        title: Row(
          children: const [
            Icon(
              Icons.home_work_rounded,
              color: utils.Colors.ocre,
              size: 35,
            ),
            Text(
              'Uhome',
              style: TextStyle(
                  fontSize: 25,
                  color: utils.Colors.blanco,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                int contador = 0;
                for (var i = 0; i < inmuebleServices.inmuebles.length; i++) {
                  if (correo == inmuebleServices.inmuebles[i].correo) {
                    contador++;
                    misPublicaciones.add(inmuebleServices.inmuebles[i]);
                    imagnesMispublicaciones
                        .add(listaSugerncias.listaSugerencias[i]);
                  }
                }

                print(
                    'El correo que se va es $contador ${misPublicaciones.length}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaMisPublicaciones(
                            titulo: 'Mis publicaciones',
                            editar: true,
                            correoo: correo!,
                            slides: misPublicaciones,
                            misImagenes: imagnesMispublicaciones,
                          )),
                );
              },
              icon: Icon(Icons.list_alt_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Inmuebles sugeridos',
                      style: TextStyle(
                          fontSize: 25,
                          color: utils.Colors.blanco,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const _buscador(),
                const SizedBox(
                  height: 10,
                ),
                //*lista de inmuebles favoritos
                _listaFavoritos(
                  listaInmuebles: inmuebleServices,
                  listaFavoritos: listaFavoritos,
                ),
                _textSugerencias(context, inmuebleServices.inmuebles,
                    listaSugerncias.listaSugerencias),
                //*lista de inmuebles sugeridos
                _listaSugerencias(
                  listaInmuebles: inmuebleServices,
                  listaSugerncias: listaSugerncias,
                )
              ],
            )),
      ),
      //*la parte inferior del la pantalla
      bottomNavigationBar:
          _bottomNavigationBar(listaFavoritos: listaFavoritos, correo: correo!),
    );
  }

//*Texto de sugerincia
//*Boton de ver todo para ver la lista de todas las sugerencias
  Row _textSugerencias(
      BuildContext context, List listaInmuebles, List listaSugerncias) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Sugerencias',
                style: TextStyle(
                    color: utils.Colors.blanco,
                    fontSize: 16,
                    fontWeight: FontWeight.w500))),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListasPage(
                          titulo: 'Sugerencias',
                          editar: false,
                          correoo: correo!,
                          slides: listaSugerncias,
                        )),
              );
            },
            child: const Text(
              'Ver todo',
              style: TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}

//*El navegador de la parte inferior
class _bottomNavigationBar extends StatelessWidget {
  String correo;

  _bottomNavigationBar(
      {Key? key, required this.listaFavoritos, required this.correo})
      : super(key: key);

  final ListaLlenaFavoritos listaFavoritos;
  @override
  Widget build(BuildContext context) {
    final usuariosServices = Provider.of<UsuariosServices>(context);
    return BottomNavigationBar(
        backgroundColor: utils.Colors.fondoOscuro,
        items: [
          new BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              onPressed: () {},
            ),
            label: '',
          ),
          new BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 35,
                  color: utils.Colors.grisClaro,
                ),
                onPressed: () {
                  print('El correo que llego aca es $correo');

                  String correoGuardado = correo;
                  print('El correo guardado $correoGuardado');

                  int contador = 0;
                  for (var i = 0; i < usuariosServices.usuarios.length; i++) {
                    if (correo != '') {
                      if (usuariosServices.usuarios[i].correo == correo) {
                        correoGuardado = usuariosServices.usuarios[i].correo;
                        print('el correo gurdado $correoGuardado');
                        contador++;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerfilPage(
                                    correo: usuariosServices.usuarios[i].correo,
                                    nombre: usuariosServices.usuarios[i].nombre,
                                    apellidos:
                                        usuariosServices.usuarios[i].apellidos,
                                    telefono: usuariosServices
                                        .usuarios[i].telefono
                                        .toString(),
                                    whatsapp:
                                        usuariosServices.usuarios[i].whatsapp,
                                    telegram:
                                        usuariosServices.usuarios[i].telegram,
                                  )),
                        );
                      }
                    } else {
                      if (usuariosServices.usuarios[i].correo ==
                          correoGuardado) {
                        correoGuardado = usuariosServices.usuarios[i].correo;
                        print('el correo gurdado $correoGuardado');
                        contador++;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerfilPage(
                                    correo: usuariosServices.usuarios[i].correo,
                                    nombre: usuariosServices.usuarios[i].nombre,
                                    apellidos:
                                        usuariosServices.usuarios[i].apellidos,
                                    telefono: usuariosServices
                                        .usuarios[i].telefono
                                        .toString(),
                                    whatsapp:
                                        usuariosServices.usuarios[i].whatsapp,
                                    telegram:
                                        usuariosServices.usuarios[i].telegram,
                                  )),
                        );
                      }
                    }
                  }
                  if (contador == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PerfilPage(
                                correo: correo,
                                nombre: 'Sin nombre',
                                apellidos: '',
                                telefono: '',
                                whatsapp: false,
                                telegram: false,
                              )),
                    );
                  }
                },
              ),
              label: ''),
        ]);
  }
}

//*Muestra la lista de inmuebles sugeridos
class _listaSugerencias extends StatelessWidget {
  InmueblesServices listaInmuebles;
  ListaLlenaSugerencias listaSugerncias;
  _listaSugerencias(
      {Key? key, required this.listaInmuebles, required this.listaSugerncias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaInmuebles.inmuebles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print(
                        'lista de inmuebles${listaInmuebles.inmuebles[index]}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SidesShow(
                                slides: listaSugerncias
                                    .listaSugerencias[index].imagenes,
                                direccion:
                                    listaInmuebles.inmuebles[index].direccion,
                                barrio: listaInmuebles
                                    .inmuebles[index].nombreInmueble,
                                precio: listaInmuebles.inmuebles[index].precio
                                    .toString(),
                                descripcion:
                                    listaInmuebles.inmuebles[index].descripcion,
                                listaInmuebles: listaInmuebles,
                                apellidosArrendador:
                                    listaInmuebles.inmuebles[index].apellidos,
                                area: listaInmuebles.inmuebles[index].area,
                                correo: listaInmuebles.inmuebles[index].correo,
                                estrato:
                                    listaInmuebles.inmuebles[index].estrato,
                                fumar: listaInmuebles.inmuebles[index].fumar,
                                internt:
                                    listaInmuebles.inmuebles[index].internt,
                                lavadero:
                                    listaInmuebles.inmuebles[index].lavadero,
                                mascotas:
                                    listaInmuebles.inmuebles[index].mascotas,
                                muebles:
                                    listaInmuebles.inmuebles[index].muebles,
                                nombreArrendador: listaInmuebles
                                    .inmuebles[index].nombrePersona,
                                parqueadero:
                                    listaInmuebles.inmuebles[index].parqueadero,
                                servicios:
                                    listaInmuebles.inmuebles[index].servicios,
                                telefonoArrendador: listaInmuebles
                                    .inmuebles[index].telefono
                                    .toString(),
                                telegram:
                                    listaInmuebles.inmuebles[index].telegram,
                                whatsapp:
                                    listaInmuebles.inmuebles[index].whatsapp,
                                tipo: listaInmuebles.inmuebles[index].tipo,
                                cantBanos:
                                    listaInmuebles.inmuebles[index].cantbanos,
                                cantHabitaciones: listaInmuebles
                                    .inmuebles[index].cantHabitaciones,
                              )),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: utils.Colors.azulOscuro,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    opacity: 0.50,
                                    image: AssetImage(listaSugerncias
                                        .listaSugerencias[index].iamgen),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listaInmuebles.inmuebles[index].direccion,
                                      style: const TextStyle(
                                          color: utils.Colors.blanco,
                                          fontWeight: FontWeight.w300),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                              Text(
                                listaInmuebles.inmuebles[index].nombreInmueble,
                                style: const TextStyle(
                                    fontSize: 16, color: utils.Colors.blanco),
                              ),
                              Text(
                                '\$${listaInmuebles.inmuebles[index].precio}',
                                style: const TextStyle(
                                    color: utils.Colors.ocre,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//*Lista de los inmuebles gurdados o considerados como favoritos
class _listaFavoritos extends StatelessWidget {
  InmueblesServices listaInmuebles;
  ListaLlenaFavoritos listaFavoritos;
  _listaFavoritos({required this.listaInmuebles, required this.listaFavoritos});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      height: 370,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listaInmuebles.inmuebles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SidesShow(
                                slides: listaFavoritos
                                    .listaFavoritos[index].imagenes,
                                direccion:
                                    listaInmuebles.inmuebles[index].direccion,
                                barrio: listaInmuebles
                                    .inmuebles[index].nombreInmueble,
                                precio: listaInmuebles.inmuebles[index].precio
                                    .toString(),
                                descripcion:
                                    listaInmuebles.inmuebles[index].descripcion,
                                listaInmuebles: listaInmuebles,
                                apellidosArrendador:
                                    listaInmuebles.inmuebles[index].apellidos,
                                area: listaInmuebles.inmuebles[index].area,
                                correo: listaInmuebles.inmuebles[index].correo,
                                estrato:
                                    listaInmuebles.inmuebles[index].estrato,
                                fumar: listaInmuebles.inmuebles[index].fumar,
                                internt:
                                    listaInmuebles.inmuebles[index].internt,
                                lavadero:
                                    listaInmuebles.inmuebles[index].lavadero,
                                mascotas:
                                    listaInmuebles.inmuebles[index].mascotas,
                                muebles:
                                    listaInmuebles.inmuebles[index].muebles,
                                nombreArrendador: listaInmuebles
                                    .inmuebles[index].nombrePersona,
                                parqueadero:
                                    listaInmuebles.inmuebles[index].parqueadero,
                                servicios:
                                    listaInmuebles.inmuebles[index].servicios,
                                telefonoArrendador: listaInmuebles
                                    .inmuebles[index].telefono
                                    .toString(),
                                telegram:
                                    listaInmuebles.inmuebles[index].telegram,
                                whatsapp:
                                    listaInmuebles.inmuebles[index].whatsapp,
                                tipo: listaInmuebles.inmuebles[index].tipo,
                                cantBanos:
                                    listaInmuebles.inmuebles[index].cantbanos,
                                cantHabitaciones: listaInmuebles
                                    .inmuebles[index].cantHabitaciones,
                              )),
                    );
                  },
                  child: Container(
                    height: 364,
                    width: 280,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          opacity: 0.50,
                          image: AssetImage(
                              listaFavoritos.listaFavoritos[index].iamgen),
                          fit: BoxFit.cover,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listaInmuebles.inmuebles[index].direccion,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: utils.Colors.blanco),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            listaInmuebles.inmuebles[index].nombreInmueble,
                            style: const TextStyle(
                                fontSize: 15, color: utils.Colors.blanco),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ ${listaInmuebles.inmuebles[index].precio}',
                                style: const TextStyle(
                                    color: utils.Colors.blanco,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(child: Container()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//*Buscador que nos manda a los filtros
class _buscador extends StatelessWidget {
  const _buscador({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: GestureDetector(
          onTap: () {
            //*Parte del filtro
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: utils.Colors.azulOscuro,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.home,
                    size: 35,
                    color: utils.Colors.grisOscuro,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Apto.',
                    style:
                        TextStyle(fontSize: 25, color: utils.Colors.grisClaro),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.08,
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: GestureDetector(
          onTap: () {
            //*Parte del filtro
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: utils.Colors.ocre,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                children: const [
                  Icon(
                    Icons.bed,
                    size: 35,
                    color: utils.Colors.grisOscuro,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Habitación',
                    style:
                        TextStyle(fontSize: 25, color: utils.Colors.grisClaro),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
