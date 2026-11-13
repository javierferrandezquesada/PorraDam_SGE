import 'package:flutter/material.dart';
import 'resultado_modelo.dart';

class TarjetaResultado extends StatelessWidget {
  final ResultadoModelo resultado;

  const TarjetaResultado({
    super.key,
    required this.resultado,
  });

  Color _colorFondoPuntos() {
    if (resultado.puntos >= 8) {
      return const Color(0xFFD1FAE5); // Verde menta (pleno)
    } else if (resultado.puntos > 0) {
      return const Color(0xFFE0F2FE); // Azul suave (acierto parcial)
    } else {
      return const Color(0xFFFEE2E2); // Rojo suave (fallo)
    }
  }

  Color _colorTextoPuntos() {
    if (resultado.puntos >= 8) {
      return const Color(0xFF065F46);
    } else if (resultado.puntos > 0) {
      return const Color(0xFF0369A1);
    } else {
      return const Color(0xFFB91C1C);
    }
  }

  Color _colorTextoPorra() {
    if (resultado.puntos >= 4) {
      return const Color(0xFF16A34A);
    } else if (resultado.puntos > 0) {
      return const Color(0xFF64748B);
    } else {
      return const Color(0xFFDC2626);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String textoPuntos =
    resultado.puntos > 0 ? '+${resultado.puntos}' : '0';

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
                      resultado.escudoLocal,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                      semanticLabel: 'Escudo de ${resultado.equipoLocal}',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        resultado.equipoLocal,
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
                      resultado.escudoVisitante,
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                      semanticLabel: 'Escudo de ${resultado.equipoVisitante}',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        resultado.equipoVisitante,
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
                    'Tu porra: ${resultado.golesPorraLocal} - ${resultado.golesPorraVisitante}',
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
                '${resultado.golesOficialLocal}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${resultado.golesOficialVisitante}',
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