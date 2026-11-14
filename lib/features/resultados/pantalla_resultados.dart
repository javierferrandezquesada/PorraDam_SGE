import 'package:flutter/material.dart';
import 'tarjeta_resultado.dart';

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
                  const TarjetaResultado(
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
                  const TarjetaResultado(
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
                  const TarjetaResultado(
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
                  const TarjetaResultado(
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
                  const TarjetaResultado(
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