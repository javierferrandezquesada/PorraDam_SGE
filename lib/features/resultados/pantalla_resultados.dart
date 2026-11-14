import 'package:flutter/material.dart';

class PantallaResultados extends StatelessWidget {
  const PantallaResultados({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera con título y selector visual estático de jornada
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Jornada 1',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Color(0xFF475569),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tarjeta blanca con los 5 partidos y resumen inferior
          Card(
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
                  const _TarjetaResultado(
                    equipoLocal: 'Atlético Madrid',
                    escudoLocal: 'assets/images/escudos/escudo_atletico.png',
                    equipoVisitante: 'Real Madrid',
                    escudoVisitante: 'assets/images/escudos/escudo_madrid.png',
                    golesOficialLocal: 2,
                    golesOficialVisitante: 1,
                    golesPorraLocal: 2,
                    golesPorraVisitante: 1,
                    puntos: 8,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  const _TarjetaResultado(
                    equipoLocal: 'FC Barcelona',
                    escudoLocal: 'assets/images/escudos/escudo_barcelona.png',
                    equipoVisitante: 'Villarreal CF',
                    escudoVisitante: 'assets/images/escudos/escudo_villarreal.png',
                    golesOficialLocal: 3,
                    golesOficialVisitante: 0,
                    golesPorraLocal: 2,
                    golesPorraVisitante: 0,
                    puntos: 4,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  const _TarjetaResultado(
                    equipoLocal: 'Sevilla FC',
                    escudoLocal: 'assets/images/escudos/escudo_sevilla.png',
                    equipoVisitante: 'Real Sociedad',
                    escudoVisitante: 'assets/images/escudos/escudo_realsociedad.png',
                    golesOficialLocal: 1,
                    golesOficialVisitante: 1,
                    golesPorraLocal: 1,
                    golesPorraVisitante: 0,
                    puntos: 2,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  const _TarjetaResultado(
                    equipoLocal: 'Betis',
                    escudoLocal: 'assets/images/escudos/escudo_betis.png',
                    equipoVisitante: 'Valencia CF',
                    escudoVisitante: 'assets/images/escudos/escudo_valencia.png',
                    golesOficialLocal: 2,
                    golesOficialVisitante: 1,
                    golesPorraLocal: 1,
                    golesPorraVisitante: 1,
                    puntos: 0,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  const _TarjetaResultado(
                    equipoLocal: 'Athletic Club',
                    escudoLocal: 'assets/images/escudos/escudo_athletic.png',
                    equipoVisitante: 'Celta de Vigo',
                    escudoVisitante: 'assets/images/escudos/escudo_celta.png',
                    golesOficialLocal: 1,
                    golesOficialVisitante: 0,
                    golesPorraLocal: 1,
                    golesPorraVisitante: 0,
                    puntos: 8,
                  ),

                  const SizedBox(height: 16),

                  // Tarjeta resumen inferior: Total jornada +22 pts
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
                            'Total jornada',
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
                          child: const Text(
                            '+22 pts',
                            style: TextStyle(
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
        ],
      ),
    );
  }
}

class _TarjetaResultado extends StatelessWidget {
  final String equipoLocal;
  final String escudoLocal;
  final String equipoVisitante;
  final String escudoVisitante;
  final int golesOficialLocal;
  final int golesOficialVisitante;
  final int golesPorraLocal;
  final int golesPorraVisitante;
  final int puntos;

  const _TarjetaResultado({
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

  Color _colorFondoPuntos() {
    if (puntos >= 8) {
      return const Color(0xFFD1FAE5);
    } else if (puntos > 0) {
      return const Color(0xFFE0F2FE);
    } else {
      return const Color(0xFFFEE2E2);
    }
  }

  Color _colorTextoPuntos() {
    if (puntos >= 8) {
      return const Color(0xFF065F46);
    } else if (puntos > 0) {
      return const Color(0xFF0369A1);
    } else {
      return const Color(0xFFB91C1C);
    }
  }

  Color _colorTextoPorra() {
    if (puntos >= 4) {
      return const Color(0xFF16A34A);
    } else if (puntos > 0) {
      return const Color(0xFF64748B);
    } else {
      return const Color(0xFFDC2626);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String textoPuntos = puntos > 0 ? '+$puntos' : '0';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Columna izquierda: equipos + "Tu porra"
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      escudoLocal,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                      semanticLabel: 'Escudo de $equipoLocal',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        equipoLocal,
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
                      escudoVisitante,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                      semanticLabel: 'Escudo de $equipoVisitante',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        equipoVisitante,
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
                    'Tu porra: $golesPorraLocal - $golesPorraVisitante',
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

          // Columna central: marcador oficial
          Column(
            children: [
              Text(
                '$golesOficialLocal',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$golesOficialVisitante',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          // Columna derecha: insignia con los puntos obtenidos
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