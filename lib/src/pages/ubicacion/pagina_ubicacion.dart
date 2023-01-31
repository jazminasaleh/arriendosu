import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_arriendosu/src/utils/colors.dart' as utils;

import '../perfil/perfil.dart';

class UbicacionPage extends StatefulWidget {
  const UbicacionPage({super.key});

  @override
  State<UbicacionPage> createState() => _UbicacionPageState();
}

class _UbicacionPageState extends State<UbicacionPage> {
   Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final CameraPosition puntoInicial = CameraPosition(
      target: LatLng(5.704476, -72.941981),
      zoom: 10,
      tilt: 60,
    );
    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('universidad'),
        position: LatLng(5.704476, -72.941981),
      ),
      
    );
    return Scaffold(
      backgroundColor: utils.Colors.fondoOscuro,
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(context,MaterialPageRoute(
                builder: (context) => PerfilPage()
            ));
          },
        ),
        title: const Text('Ubicación'),
        actions: [
          IconButton(
            onPressed: ()async{
               final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target:  LatLng(5.703595, -72.943689),
                    zoom: 15,
                    tilt: 60
                  )
                )
              );
            }, 
            icon: Icon(Icons.location_on, size: 30, color: utils.Colors.ocre,))
        ],
      ),
       body: SingleChildScrollView(
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                height: 350,
                width: 350,
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: puntoInicial,
                  onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                ),
              ),
             ]
            ),
         
          ),
    );
  }
}
