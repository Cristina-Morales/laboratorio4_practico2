
class Gato {
  final String id;
  final String nombre;
  final String raza;
  final String ciudad;
  final String imagen;
  final bool adoptado;

  Gato({
    required this.id,
    required this.nombre,
    required this.raza,
    required this.ciudad,
    required this.imagen,
    required this.adoptado,
  });

  factory Gato.fromJson(Map<String, dynamic> json) {
    return Gato(
      id: json['id'],
      nombre: json['nombre'],
      raza: json['raza'],
      ciudad: json['ciudad'],
      imagen: json['imagen'],
      adoptado: json['adoptado'],
    );
  }
}