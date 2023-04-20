import 'package:flutter/material.dart';

import 'package:app_arriendosu/src/pages/perfil/perfil.dart';
import 'package:app_arriendosu/src/pages/publicaciones/publicaciones.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

import '../../widgets/slidesShow.dart';

//*Pagina donde muestra las publicaciones de sugerencia y guardadas
class InicioPublicaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListaLlenaFavoritos listaFavoritos = new ListaLlenaFavoritos();
    ListaLlenaSugerencias listaSugernecias = new ListaLlenaSugerencias();
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
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  color: utils.Colors.blanco,
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListasPage(
                          lista: listaFavoritos.listaFavoritos,
                          titulo: 'Gurdaddos',
                        )
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.bookmark_outline_rounded,
                    color: utils.Colors.blanco,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
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
                    'Hola, jas',
                    style: TextStyle(
                      fontSize: 25,
                      color: utils.Colors.blanco,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              const _buscador(),
              const SizedBox(height: 10,),
              //*lista de inmuebles favoritos
              _listaFavoritos(listaFavoritos: listaFavoritos.listaFavoritos),
              _textSugerencias(context, listaSugernecias),
               //*lista de inmuebles sugeridos
              _listaSugerencias(listaSugerencias: listaSugernecias.listaSugerencias)
            ],
          )
        ),
      ),
      //*la parte inferior del la pantalla 
      bottomNavigationBar: _bottomNavigationBar(listaFavoritos: listaFavoritos),
    );
  }

//*Texto de sugerincia
//*Boton de ver todo para ver la lista de todas las sugerencias
  Row _textSugerencias(
    BuildContext context, ListaLlenaSugerencias listaSugernecias) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Sugerencias',
            style: TextStyle(
              color: utils.Colors.blanco,
              fontSize: 16,
              fontWeight: FontWeight.w500
            )
          )
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListasPage(lista: listaSugernecias.listaSugerencias,titulo: 'Sugerencias',)
              ),
            );
          },
          child: const Text(
            'Ver todo',
            style: TextStyle(fontSize: 16),
          )
        ),
      ],
    );
  }
}

//*El navegador de la parte inferior
class _bottomNavigationBar extends StatelessWidget {
  const _bottomNavigationBar({
    Key? key,
    required this.listaFavoritos,
  }) : super(key: key);

  final ListaLlenaFavoritos listaFavoritos;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: utils.Colors.fondoOscuro,
      items: [
        new BottomNavigationBarItem (
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
                Icons.search_rounded,
                size: 35,
                color: utils.Colors.grisClaro,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
            label: ''
          ),
        ]
      );
  }
}

//*Muestra la lista de inmuebles sugeridos
class _listaSugerencias extends StatelessWidget {
  const _listaSugerencias({
    Key? key,
    required this.listaSugerencias,
  }) : super(key: key);

  final List<ListaSugernecias> listaSugerencias;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaSugerencias.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SidesShow(
                          slides: listaSugerencias[index].imagenes,
                          direccion: listaSugerencias[index].direccion, 
                          barrio: listaSugerencias[index].barrio, 
                          precio: listaSugerencias[index].precio, 
                          iconosDetalles: listaSugerencias[index].iconosDetalle, 
                          nombreDeatlles: listaSugerencias[index].nombreDetalle, 
                          iconosRestricciones: listaSugerencias[index].iconosRestricciones, 
                          nombreRestricciones: listaSugerencias[index].nombreRestricciones, 
                          descripcion: '',
                        ) 
                      ),
                    );
                  },
                  child: Container(
                    height:  MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.width*0.90,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                              width:  MediaQuery.of(context).size.width*0.25,
                              height: MediaQuery.of(context).size.height*0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  opacity: 0.50,
                                  image: AssetImage(
                                    listaSugerencias[index].iamgen
                                  ),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text(
                                    listaSugerencias[index].direccion,
                                    style: const TextStyle(
                                      color: utils.Colors.blanco,
                                      fontWeight: FontWeight.w300
                                    ),
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ] 
                              ),
                              Text(
                                listaSugerencias[index].barrio,
                                style: const TextStyle(
                                  fontSize: 16, color: utils.Colors.blanco
                                ),
                              ),
                              Text(
                                '\$${listaSugerencias[index].precio}',
                                style: const TextStyle(
                                  color: utils.Colors.ocre,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                                ),
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
  const _listaFavoritos({
    required this.listaFavoritos,
  });

  final List<ListaFavoritos> listaFavoritos;

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
                itemCount: listaFavoritos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                     onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SidesShow(
                              slides: listaFavoritos[index].imagenes,
                              direccion: listaFavoritos[index].direccion, 
                              barrio: listaFavoritos[index].barrio, 
                              precio: listaFavoritos[index].precio, 
                              iconosDetalles: listaFavoritos[index].iconosDetalle, 
                              nombreDeatlles: listaFavoritos[index].nombreDetalle, 
                              iconosRestricciones: listaFavoritos[index].iconosRestricciones,
                              nombreRestricciones: listaFavoritos[index].nombreRestricciones,
                              descripcion: listaFavoritos[index].descripcion,
                            ) 
                          ),
                        );
                      },
                    child: Container(
                      height: 364,
                      width: 280,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            opacity: 0.50,
                            image: AssetImage(listaFavoritos[index].iamgen),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listaFavoritos[index].direccion,
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
                              listaFavoritos[index].barrio,
                              style: const TextStyle(
                                  fontSize: 15, color: utils.Colors.blanco),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$ ${listaFavoritos[index].precio}',
                                  style: const TextStyle(
                                      color: utils.Colors.blanco,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(child: Container()),
                                const Icon(
                                  Icons.bookmark_outline_rounded,
                                  color: utils.Colors.blanco,
                                  size: 30,
                                ),
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
    return Padding(
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
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  size: 35,
                  color: utils.Colors.grisOscuro,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Buscar',
                  style: TextStyle(fontSize: 25, color: utils.Colors.grisClaro),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
