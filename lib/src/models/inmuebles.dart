// To parse this JSON data, do
//
//     final inmuebles = inmueblesFromMap(jsonString);

import 'dart:convert';

Inmuebles inmueblesFromMap(String str) => Inmuebles.fromMap(json.decode(str));

String inmueblesToMap(Inmuebles data) => json.encode(data.toMap());

class Inmuebles {
  String apellidos;
  int area;
  int cantHabitaciones;
  int cantbanos;
  String correo;
  String descripcion;
  String direccion;
  int estrato;
  String fotos;
  bool fumar;
  bool internt;
  bool lavadero;
  bool mascotas;
  bool muebles;
  String nombreInmueble;
  String nombrePersona;
  bool parqueadero;
  int precio;
  bool servicios;
  bool telegram;
  String tipo;
  bool whatsapp;
  int telefono;
  String? id;

  Inmuebles(
      {required this.apellidos,
      required this.area,
      required this.cantHabitaciones,
      required this.cantbanos,
      required this.correo,
      required this.descripcion,
      required this.direccion,
      required this.estrato,
      required this.fotos,
      required this.fumar,
      required this.internt,
      required this.lavadero,
      required this.mascotas,
      required this.muebles,
      required this.nombreInmueble,
      required this.nombrePersona,
      required this.parqueadero,
      required this.precio,
      required this.servicios,
      required this.telegram,
      required this.tipo,
      required this.whatsapp,
      required this.telefono,
      this.id});

  factory Inmuebles.fromJson(String str) => Inmuebles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inmuebles.fromMap(Map<String, dynamic> json) => Inmuebles(
        apellidos: json["apellidos"],
        area: json["area"],
        cantHabitaciones: json["cantHabitaciones"],
        cantbanos: json["cantbanos"],
        correo: json["correo"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        estrato: json["estrato"],
        fotos: json["fotos"],
        fumar: json["fumar"],
        internt: json["internt"],
        lavadero: json["lavadero"],
        mascotas: json["mascotas"],
        muebles: json["muebles"],
        nombreInmueble: json["nombreInmueble"].toString(),
        nombrePersona: json["nombrePersona"],
        parqueadero: json["parqueadero"],
        precio: json["precio"],
        servicios: json["servicios"],
        telegram: json["telegram"],
        tipo: json["tipo"],
        whatsapp: json["whatsapp"],
        telefono: json["telefono"]
      );

  Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "area": area,
        "cantHabitaciones": cantHabitaciones,
        "cantbanos": cantbanos,
        "correo": correo,
        "descripcion": descripcion,
        "direccion": direccion,
        "estrato": estrato,
        "fotos": fotos,
        "fumar": fumar,
        "internt": internt,
        "lavadero": lavadero,
        "mascotas": mascotas,
        "muebles": muebles,
        "nombreInmueble": nombreInmueble,
        "nombrePersona": nombrePersona,
        "parqueadero": parqueadero,
        "precio": precio,
        "servicios": servicios,
        "telegram": telegram,
        "tipo": tipo,
        "telefono": telefono,
        "whatsapp": whatsapp,
      };
}
