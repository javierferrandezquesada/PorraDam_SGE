class ResultadoModelo {
  final String equipoLocal;
  final String escudoLocal;
  final String equipoVisitante;
  final String escudoVisitante;
  final int golesOficialLocal;
  final int golesOficialVisitante;
  final int golesPorraLocal;
  final int golesPorraVisitante;
  final int puntos;

  const ResultadoModelo({
    required this.equipoLocal,
    required this.escudoLocal,
    required this.equipoVisitante,
    required this.escudoVisitante,
    required this.golesOficialLocal,
    required this.golesOficialVisitante,
    required this.golesPorraLocal,
    required this.golesPorraVisitante,
    required this.puntos,
  });
}