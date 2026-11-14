import 'package:flutter/material.dart';

class TarjetaResultado extends StatelessWidget {
  final String equipoLocal;
  final String escudoLocal;
  final String equipoVisitante;
  final String escudoVisitante;
  final int golesOficialLocal;
  final int golesOficialVisitante;
  final int golesPorraLocal;
  final int golesPorraVisitante;
  final int puntos;

  const TarjetaResultado({
    super.key,
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