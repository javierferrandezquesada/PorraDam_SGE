class Partido {
  const Partido({
    required this.id,
    required this.jornada,
    required this.local,
    required this.escudoLocal,
    required this.visitante,
    required this.escudoVisitante,
    this.golesLocal,
    this.golesVisitante,
  });

  final int id;
  final int jornada;
  final String local;
  final String escudoLocal;
  final String visitante;
  final String escudoVisitante;
  final int? golesLocal;
  final int? golesVisitante;

  bool get jugado => golesLocal != null && golesVisitante != null;

  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      id: json['id'] as int,
      jornada: json['jornada'] as int,
      local: json['local'] as String,
      escudoLocal: json['escudoLocal'] as String,
      visitante: json['visitante'] as String,
      escudoVisitante: json['escudoVisitante'] as String,
      golesLocal: json['golesLocal'] as int?,
      golesVisitante: json['golesVisitante'] as int?,
    );
  }
}