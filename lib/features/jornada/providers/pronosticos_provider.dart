import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/partidos_local.dart';
import '../models/partido.dart';
import '../models/pronostico.dart';

class PronosticosNotifier extends Notifier<Map<int, Pronostico>> {
  @override
  Map<int, Pronostico> build() => {};

  void guardar(Pronostico p) {
    state = {...state, p.partidoId: p};
  }

  void borrar(int partidoId) {
    state = {...state}..remove(partidoId);
  }
}

final pronosticosProvider =
NotifierProvider<PronosticosNotifier, Map<int, Pronostico>>(
  PronosticosNotifier.new,
);

final partidosAsyncProvider = FutureProvider<List<Partido>>((ref) {
  return cargarPartidos();
});

final partidosJugadosProvider = Provider<List<Partido>>((ref) {
  final asyncPartidos = ref.watch(partidosAsyncProvider);
  return asyncPartidos.maybeWhen(
    data: (lista) => lista.where((p) => p.jugado).toList(),
    orElse: () => const [],
  );
});
