import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../clasificacion/providers/puntos_provider.dart';
import '../clasificacion/puntuacion.dart';
import '../jornada/models/partido.dart';
import '../jornada/models/pronostico.dart';
import '../jornada/providers/pronosticos_provider.dart';

class PantallaResultados extends ConsumerWidget {
  const PantallaResultados({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Partido> partidosJugados = ref.watch(partidosJugadosProvider);
    final Map<int, Pronostico> pronosticos = ref.watch(pronosticosProvider);
    final int totalPuntos = ref.watch(puntosTotalesProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resultados',
                      style: TextStyle(
                        fontFamily: 'Boldonse',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Resultados oficiales y puntos obtenidos',
                      style: TextStyle(
                        fontFamily: 'HostGrotesk',
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Jugados',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
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
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: partidosJugados.length,
                        itemBuilder: (context, i) {
                          final partido = partidosJugados[i];
                          final pronostico = pronosticos[partido.id];
                          final int pts = pronostico != null
                              ? puntosDe(pronostico, partido)
                              : 0;

                          return Column(
                            children: [
                              _TarjetaResultado(
                                partido: partido,
                                pronostico: pronostico,
                                puntos: pts,
                              ),
                              if (i < partidosJugados.length - 1)
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFACC15),
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Total partidos jugados',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD1FAE5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '+$totalPuntos pts',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF065F46),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaResultado extends StatelessWidget {
  final Partido partido;
  final Pronostico? pronostico;
  final int puntos;

  const _TarjetaResultado({
    required this.partido,
    required this.pronostico,
    required this.puntos,
  });

  Color _colorFondoPuntos() {
    if (pronostico == null) return const Color(0xFFF1F5F9);
    if (puntos >= 8) return const Color(0xFFD1FAE5);
    if (puntos > 0) return const Color(0xFFE0F2FE);
    return const Color(0xFFFEE2E2);
  }

  Color _colorTextoPuntos() {
    if (pronostico == null) return const Color(0xFF64748B);
    if (puntos >= 8) return const Color(0xFF065F46);
    if (puntos > 0) return const Color(0xFF0369A1);
    return const Color(0xFFB91C1C);
  }

  Color _colorTextoPorra() {
    if (pronostico == null) return const Color(0xFF94A3B8);
    if (puntos >= 4) return const Color(0xFF16A34A);
    if (puntos > 0) return const Color(0xFF64748B);
    return const Color(0xFFDC2626);
  }

  @override
  Widget build(BuildContext context) {
    final String textoPuntos = pronostico == null
        ? '-'
        : (puntos > 0 ? '+$puntos' : '0');
    final String textoPorra = pronostico == null
        ? 'Sin pronóstico'
        : 'Tu porra: ${pronostico!.local} - ${pronostico!.visitante}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      partido.escudoLocal,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        partido.local,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset(
                      partido.escudoVisitante,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        partido.visitante,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    textoPorra,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _colorTextoPorra(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '${partido.golesLocal ?? 0}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${partido.golesVisitante ?? 0}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Container(
            width: 46,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _colorFondoPuntos(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              textoPuntos,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _colorTextoPuntos(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}