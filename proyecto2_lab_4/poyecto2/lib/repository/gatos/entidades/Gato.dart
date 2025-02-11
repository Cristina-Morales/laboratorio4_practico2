// To parse this JSON data, do
//
//     final gato = gatoFromJson(jsonString);

import 'dart:convert';

Gato gatoFromJson(String str) => Gato.fromJson(json.decode(str));

String gatoToJson(Gato data) => json.encode(data.toJson());

class Gato {
    String msg;
    List<Datum> data;

    Gato({
        required this.msg,
        required this.data,
    });

    factory Gato.fromJson(Map<String, dynamic> json) => Gato(
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String raza;
    String imagen;
    Sexo sexo;
    String nombre;
    bool adoptado;
    String ciudad;
    DateTime cumple;
    String id;

    Datum({
        required this.raza,
        required this.imagen,
        required this.sexo,
        required this.nombre,
        required this.adoptado,
        required this.ciudad,
        required this.cumple,
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        raza: json["raza"],
        imagen: json["imagen"],
        sexo: sexoValues.map[json["sexo"]]!,
        nombre: json["nombre"],
        adoptado: json["adoptado"],
        ciudad: json["ciudad"],
        cumple: DateTime.parse(json["cumple"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "raza": raza,
        "imagen": imagen,
        "sexo": sexoValues.reverse[sexo],
        "nombre": nombre,
        "adoptado": adoptado,
        "ciudad": ciudad,
        "cumple": cumple.toIso8601String(),
        "id": id,
    };
}

enum Sexo {
    FEMALE,
    MALE
}

final sexoValues = EnumValues({
    "female": Sexo.FEMALE,
    "male": Sexo.MALE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
