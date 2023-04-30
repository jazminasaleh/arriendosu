import 'dart:convert';

Usuarios usuariosFromMap(String str) => Usuarios.fromMap(json.decode(str));

String usuariosToMap(Usuarios data) => json.encode(data.toMap());

class Usuarios {
  String apellidos;
  String correo;
  String foto;
  String nombre;
  int telefono;
  bool telegram;
  bool whatsapp;
  String? id;

  Usuarios({
    required this.apellidos,
    required this.correo,
    required this.foto,
    required this.nombre,
    required this.telefono,
    required this.telegram,
    required this.whatsapp,
    this.id
  });
  factory Usuarios.fromJson(String str) => Usuarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuarios.fromMap(Map<String, dynamic> json) => Usuarios(
        apellidos: json["apellidos"],
        correo: json["correo"],
        foto: json["foto"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        telegram: json["telegram"],
        whatsapp: json["whatsapp"],
      );

  Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "correo": correo,
        "foto": foto,
        "nombre": nombre,
        "telefono": telefono,
        "telegram": telegram,
        "whatsapp": whatsapp,
      };
}
