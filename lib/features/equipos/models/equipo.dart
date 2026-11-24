class Equipo {
  const Equipo({
    required this.id,
    required this.nombre,
    required this.iniciales,
    required this.color,
  });

  final int id;
  final String nombre;
  final String iniciales;
  final int color;

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
    id: json['id'] as int,
    nombre: json['nombre'] as String,
    iniciales: json['iniciales'] as String,
    color: json['color'] as int,
  );
}