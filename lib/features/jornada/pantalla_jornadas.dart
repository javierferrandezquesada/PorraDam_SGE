import 'package:flutter/material.dart';

class PantallaJornadas extends StatefulWidget {
  final String alias;

  const PantallaJornadas({
    super.key,
    this.alias = 'Sin Usuario',
  });

  @override
  State<PantallaJornadas> createState() => _PantallaJornadasState();
}

class _PantallaJornadasState extends State<PantallaJornadas> {
  bool _pronosticosGuardados = false;

  void _alModificarPronostico() {
    if (_pronosticosGuardados) {
      setState(() {
        _pronosticosGuardados = false;
      });
    }
  }

  void _guardarPronosticos() {
    setState(() {
      _pronosticosGuardados = true;
    });
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
                  _TarjetaPartido(
                    equipoLocal: 'Atlético Madrid',
                    escudoLocal: 'assets/images/escudos/escudo_atletico.png',
                    equipoVisitante: 'Real Madrid',
                    escudoVisitante: 'assets/images/escudos/escudo_madrid.png',
                    golesLocalInicial: 2,
                    golesVisitanteInicial: 1,
                    onCambio: _alModificarPronostico,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  _TarjetaPartido(
                    equipoLocal: 'FC Barcelona',
                    escudoLocal: 'assets/images/escudos/escudo_barcelona.png',
                    equipoVisitante: 'Villarreal CF',
                    escudoVisitante: 'assets/images/escudos/escudo_villarreal.png',
                    golesLocalInicial: 3,
                    golesVisitanteInicial: 0,
                    onCambio: _alModificarPronostico,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  _TarjetaPartido(
                    equipoLocal: 'Sevilla FC',
                    escudoLocal: 'assets/images/escudos/escudo_sevilla.png',
                    equipoVisitante: 'Real Sociedad',
                    escudoVisitante: 'assets/images/escudos/escudo_realsociedad.png',
                    golesLocalInicial: 1,
                    golesVisitanteInicial: 1,
                    onCambio: _alModificarPronostico,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  _TarjetaPartido(
                    equipoLocal: 'Betis',
                    escudoLocal: 'assets/images/escudos/escudo_betis.png',
                    equipoVisitante: 'Valencia CF',
                    escudoVisitante: 'assets/images/escudos/escudo_valencia.png',
                    golesLocalInicial: 2,
                    golesVisitanteInicial: 1,
                    onCambio: _alModificarPronostico,
                  ),
                  const Divider(height: 12, thickness: 1, color: Color(0xFFF1F5F9)),
                  _TarjetaPartido(
                    equipoLocal: 'Athletic Club',
                    escudoLocal: 'assets/images/escudos/escudo_athletic.png',
                    equipoVisitante: 'Celta de Vigo',
                    escudoVisitante: 'assets/images/escudos/escudo_celta.png',
                    golesLocalInicial: 1,
                    golesVisitanteInicial: 0,
                    onCambio: _alModificarPronostico,
                  ),
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

class _TarjetaPartido extends StatefulWidget {
  final String equipoLocal;
  final String escudoLocal;
  final String equipoVisitante;
  final String escudoVisitante;
  final int golesLocalInicial;
  final int golesVisitanteInicial;
  final VoidCallback? onCambio;

  const _TarjetaPartido({
    required this.equipoLocal,
    required this.escudoLocal,
    required this.equipoVisitante,
    required this.escudoVisitante,
    required this.golesLocalInicial,
    required this.golesVisitanteInicial,
    this.onCambio,
  });

  @override
  State<_TarjetaPartido> createState() => _TarjetaPartidoState();
}

class _TarjetaPartidoState extends State<_TarjetaPartido> {
  late int _golesLocal;
  late int _golesVisitante;

  @override
  void initState() {
    super.initState();
    _golesLocal = widget.golesLocalInicial;
    _golesVisitante = widget.golesVisitanteInicial;
  }

  void _cambiarGolesLocal(int nuevosGoles) {
    setState(() {
      _golesLocal = nuevosGoles;
    });
    widget.onCambio?.call();
  }

  void _cambiarGolesVisitante(int nuevosGoles) {
    setState(() {
      _golesVisitante = nuevosGoles;
    });
    widget.onCambio?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          _FilaEquipo(
            nombre: widget.equipoLocal,
            rutaEscudo: widget.escudoLocal,
            goles: _golesLocal,
            onGolesChanged: _cambiarGolesLocal,
          ),
          const SizedBox(height: 4),
          _FilaEquipo(
            nombre: widget.equipoVisitante,
            rutaEscudo: widget.escudoVisitante,
            goles: _golesVisitante,
            onGolesChanged: _cambiarGolesVisitante,
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