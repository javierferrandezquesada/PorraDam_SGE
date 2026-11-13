import 'package:flutter/material.dart';
import 'partido_modelo.dart';
import 'tarjeta_partido.dart';

class PantallaJornadas extends StatefulWidget {
  final String alias;

  const PantallaJornadas({
    super.key,
    this.alias = 'mcoma',
  });

  @override
  State<PantallaJornadas> createState() => _PantallaJornadasState();
}

class _PantallaJornadasState extends State<PantallaJornadas> {
  final List<PartidoModelo> _partidos = const [
    PartidoModelo(
      equipoLocal: 'Atlético Madrid',
      escudoLocal: 'assets/images/escudos/escudo_atletico.png',
      equipoVisitante: 'Real Madrid',
      escudoVisitante: 'assets/images/escudos/escudo_madrid.png',
    ),
    PartidoModelo(
      equipoLocal: 'FC Barcelona',
      escudoLocal: 'assets/images/escudos/escudo_barcelona.png',
      equipoVisitante: 'Villarreal CF',
      escudoVisitante: 'assets/images/escudos/escudo_villarreal.png',
    ),
    PartidoModelo(
      equipoLocal: 'Sevilla FC',
      escudoLocal: 'assets/images/escudos/escudo_sevilla.png',
      equipoVisitante: 'Real Sociedad',
      escudoVisitante: 'assets/images/escudos/escudo_realsociedad.png',
    ),
    PartidoModelo(
      equipoLocal: 'Betis',
      escudoLocal: 'assets/images/escudos/escudo_betis.png',
      equipoVisitante: 'Valencia CF',
      escudoVisitante: 'assets/images/escudos/escudo_valencia.png',
    ),
    PartidoModelo(
      equipoLocal: 'Athletic Club',
      escudoLocal: 'assets/images/escudos/escudo_athletic.png',
      equipoVisitante: 'Celta de Vigo',
      escudoVisitante: 'assets/images/escudos/escudo_celta.png',
    ),
  ];

  final List<int> _golesLocal = [2, 3, 1, 2, 1];
  final List<int> _golesVisitante = [1, 0, 1, 1, 0];
  bool _pronosticosGuardados = false;

  void _actualizarGolesLocal(int indice, int nuevosGoles) {
    setState(() {
      _golesLocal[indice] = nuevosGoles;
      _pronosticosGuardados = false;
    });
  }

  void _actualizarGolesVisitante(int indice, int nuevosGoles) {
    setState(() {
      _golesVisitante[indice] = nuevosGoles;
      _pronosticosGuardados = false;
    });
  }

  void _guardarPronosticos() {
    setState(() {
      _pronosticosGuardados = true;
    });
    print('Pronósticos guardados: Local $_golesLocal - Visitante $_golesVisitante');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jornada 1',
            style: TextStyle(
              fontFamily: 'Boldonse',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Bienvenido, ${widget.alias} · Tu porra para esta jornada',
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
                'Se cierra el: Sáb 12 oct · 16:00',
                style: TextStyle(
                  fontFamily: 'HostGrotesk',
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                  for (int i = 0; i < _partidos.length; i++) ...[
                    TarjetaPartido(
                      partido: _partidos[i],
                      golesLocal: _golesLocal[i],
                      golesVisitante: _golesVisitante[i],
                      onGolesLocalChanged: (valor) =>
                          _actualizarGolesLocal(i, valor),
                      onGolesVisitanteChanged: (valor) =>
                          _actualizarGolesVisitante(i, valor),
                    ),
                    if (i < _partidos.length - 1)
                      const Divider(
                        height: 12,
                        thickness: 1,
                        color: Color(0xFFF1F5F9),
                      ),
                  ],
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _guardarPronosticos,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}