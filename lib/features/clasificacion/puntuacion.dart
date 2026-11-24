import '../jornada/models/partido.dart';
import '../jornada/models/pronostico.dart';

int puntosDe(Pronostico p, Partido r) {
  final gl = r.golesLocal!, gv = r.golesVisitante!;
  if (p.local == gl && p.visitante == gv) return 8; // resultado exacto
  var puntos = 0;
  if ((p.local - p.visitante).sign == (gl - gv).sign) puntos += 2; // 1X2
  if (p.local == gl) puntos += 2;
  if (p.visitante == gv) puntos += 2;
  return puntos;
}