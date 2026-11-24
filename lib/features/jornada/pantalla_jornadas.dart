import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bienvenida/providers/alias_provider.dart';
import 'data/partidos_local.dart';
import 'models/partido.dart';
import 'models/pronostico.dart';
import 'providers/pronosticos_provider.dart';

class PantallaJornadas extends ConsumerStatefulWidget {
  const PantallaJornadas({super.key});

  @override
  ConsumerState<PantallaJornadas> createState() => _PantallaJornadasState();
}

class _PantallaJornadasState extends ConsumerState<PantallaJornadas> {
  late final Future<List<Partido>> _futuroPartidos;
  bool _pronosticosGuardados = false;

  @override
  void initState() {
    super.initState();
    _futuroPartidos = cargarPartidos();
  }

  void _guardarPronosticos(List<Partido> partidos) {
    final mapaActual = ref.read(pronosticosProvider);
    final notifier = ref.read(pronosticosProvider.notifier);

    for (final partido in partidos) {
      if (!mapaActual.containsKey(partido.id)) {
        notifier.guardar(
          Pronostico(partidoId: partido.id, local: 0, visitante: 0),
        );
      }
    }

    setState(() {
      _pronosticosGuardados = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pronósticos guardados en tu porra')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String alias = ref.watch(aliasProvider);
    final Map<int, Pronostico> pronosticos = ref.watch(pronosticosProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jornadas',
            style: TextStyle(
              fontFamily: 'Boldonse',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Bienvenido, $alias · Tu porra para esta temporada',
            style: const TextStyle(
              fontFamily: 'HostGrotesk',
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: Colors.white.withValues(alpha: 0.85),
              ),
              const SizedBox(width: 6),
              Text(
                'Toca + o - para escribir tu pronóstico',
                style: TextStyle(
                  fontFamily: 'HostGrotesk',
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              color: Colors.white,
              elevation: 4,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder<List<Partido>>(
                  future: _futuroPartidos,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error al cargar partidos: ${snapshot.error}'),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final List<Partido> partidos = snapshot.data!;

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: partidos.length,
                            itemBuilder: (context, i) {
                              final partido = partidos[i];
                              final pronostico = pronosticos[partido.id];
                              final golesLocal = pronostico?.local ?? 0;
                              final golesVisitante = pronostico?.visitante ?? 0;

                              return Column(
                                children: [
                                  _TarjetaPartido(
                                    partido: partido,
                                    golesLocal: golesLocal,
                                    golesVisitante: golesVisitante,
                                    tienePronostico: pronostico != null,
                                    onCambiarLocal: (nuevoLocal) {
                                      ref
                                          .read(pronosticosProvider.notifier)
                                          .guardar(
                                        Pronostico(
                                          partidoId: partido.id,
                                          local: nuevoLocal,
                                          visitante: golesVisitante,
                                        ),
                                      );
                                      if (_pronosticosGuardados) {
                                        setState(() => _pronosticosGuardados = false);
                                      }
                                    },
                                    onCambiarVisitante: (nuevoVisitante) {
                                      ref
                                          .read(pronosticosProvider.notifier)
                                          .guardar(
                                        Pronostico(
                                          partidoId: partido.id,
                                          local: golesLocal,
                                          visitante: nuevoVisitante,
                                        ),
                                      );
                                      if (_pronosticosGuardados) {
                                        setState(() => _pronosticosGuardados = false);
                                      }
                                    },
                                    onBorrar: () {
                                      ref
                                          .read(pronosticosProvider.notifier)
                                          .borrar(partido.id);
                                      if (_pronosticosGuardados) {
                                        setState(() => _pronosticosGuardados = false);
                                      }
                                    },
                                  ),
                                  if (i < partidos.length - 1)
                                    const Divider(
                                      height: 12,
                                      thickness: 1,
                                      color: Color(0xFFF1F5F9),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => _guardarPronosticos(partidos),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _pronosticosGuardados
                                  ? const Color(0xFF10B981)
                                  : Colors.black,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              _pronosticosGuardados
                                  ? 'Pronósticos guardados'
                                  : 'Guardar pronósticos',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaPartido extends StatelessWidget {
  final Partido partido;
  final int golesLocal;
  final int golesVisitante;
  final bool tienePronostico;
  final ValueChanged<int> onCambiarLocal;
  final ValueChanged<int> onCambiarVisitante;
  final VoidCallback onBorrar;

  const _TarjetaPartido({
    required this.partido,
    required this.golesLocal,
    required this.golesVisitante,
    required this.tienePronostico,
    required this.onCambiarLocal,
    required this.onCambiarVisitante,
    required this.onBorrar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Jornada ${partido.jornada}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tienePronostico
                      ? const Color(0xFFD1FAE5)
                      : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  tienePronostico
                      ? 'Pronosticado: $golesLocal - $golesVisitante'
                      : 'Sin pronóstico',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: tienePronostico
                        ? const Color(0xFF065F46)
                        : const Color(0xFF64748B),
                  ),
                ),
              ),
              const Spacer(),
              if (tienePronostico)
                InkWell(
                  onTap: onBorrar,
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          _FilaEquipo(
            nombre: partido.local,
            rutaEscudo: partido.escudoLocal,
            goles: golesLocal,
            onGolesChanged: onCambiarLocal,
          ),
          const SizedBox(height: 4),
          _FilaEquipo(
            nombre: partido.visitante,
            rutaEscudo: partido.escudoVisitante,
            goles: golesVisitante,
            onGolesChanged: onCambiarVisitante,
          ),
        ],
      ),
    );
  }
}

class _FilaEquipo extends StatelessWidget {
  final String nombre;
  final String rutaEscudo;
  final int goles;
  final ValueChanged<int> onGolesChanged;

  const _FilaEquipo({
    required this.nombre,
    required this.rutaEscudo,
    required this.goles,
    required this.onGolesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          rutaEscudo,
          width: 28,
          height: 28,
          fit: BoxFit.contain,
          semanticLabel: 'Escudo de $nombre',
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            nombre,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        _SelectorGoles(
          valor: goles,
          onChanged: onGolesChanged,
        ),
      ],
    );
  }
}

class _SelectorGoles extends StatelessWidget {
  final int valor;
  final ValueChanged<int> onChanged;

  const _SelectorGoles({
    required this.valor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove, size: 20),
          tooltip: 'Restar gol',
          onPressed: valor > 0 ? () => onChanged(valor - 1) : null,
        ),
        Container(
          width: 36,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Text(
            '$valor',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add, size: 20),
          tooltip: 'Sumar gol',
          onPressed: () => onChanged(valor + 1),
        ),
      ],
    );
  }
}