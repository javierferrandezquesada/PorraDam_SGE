import 'package:flutter/material.dart';
import 'partido_modelo.dart';
import 'selector_goles.dart';

class TarjetaPartido extends StatelessWidget {
  final PartidoModelo partido;
  final int golesLocal;
  final int golesVisitante;
  final ValueChanged<int> onGolesLocalChanged;
  final ValueChanged<int> onGolesVisitanteChanged;

  const TarjetaPartido({
    super.key,
    required this.partido,
    required this.golesLocal,
    required this.golesVisitante,
    required this.onGolesLocalChanged,
    required this.onGolesVisitanteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          _FilaEquipo(
            nombre: partido.equipoLocal,
            rutaEscudo: partido.escudoLocal,
            goles: golesLocal,
            onGolesChanged: onGolesLocalChanged,
          ),
          const SizedBox(height: 4),
          _FilaEquipo(
            nombre: partido.equipoVisitante,
            rutaEscudo: partido.escudoVisitante,
            goles: golesVisitante,
            onGolesChanged: onGolesVisitanteChanged,
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
        SelectorGoles(
          valor: goles,
          onChanged: onGolesChanged,
        ),
      ],
    );
  }
}