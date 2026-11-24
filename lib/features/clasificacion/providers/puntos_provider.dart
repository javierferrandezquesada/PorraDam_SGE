import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../jornada/providers/pronosticos_provider.dart';
import '../puntuacion.dart';

final puntosTotalesProvider = Provider<int>((ref) {
  final pronosticos = ref.watch(pronosticosProvider);
  final partidos = ref.watch(partidosJugadosProvider);

  var total = 0;
  for (final partido in partidos) {
    final p = pronosticos[partido.id];
    if (p != null) total += puntosDe(p, partido);
  }
  return total;
});