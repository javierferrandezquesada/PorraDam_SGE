import 'package:flutter/material.dart';
import '../clasificacion/pantalla_clasificacion.dart';
import '../jornada/pantalla_jornadas.dart';
import '../perfil/pantalla_perfil.dart';
import '../resultados/pantalla_resultados.dart';

class PantallaPrincipal extends StatefulWidget {
  final String alias;

  const PantallaPrincipal({
    super.key,
    this.alias = 'mcoma',
  });

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indiceSeleccionado = 0;

  void _cambiar(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pantallas = [
      PantallaJornadas(alias: widget.alias),
      const PantallaResultados(),
      const PantallaClasificacion(),
      const PantallaPerfil(),
    ];

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Imagen de fondo del estadio
        Image.asset(
          'assets/images/fondo_pantalla_hd.webp',
          fit: BoxFit.cover,
        ),

        // 2. Degradado oscuro para garantizar la lectura de los textos blancos
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x990F172A),
                Color(0xE60F172A),
              ],
            ),
          ),
        ),

        // 3. Scaffold único compartido por las 4 pestañas
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              tooltip: 'Menú',
              onPressed: () {},
            ),
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Porra ',
                  style: TextStyle(
                    fontFamily: 'Boldonse',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'DAM',
                  style: TextStyle(
                    fontFamily: 'Boldonse',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA2E8DD),
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '38 pts',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF065F46),
                  ),
                ),
              ),
            ],
          ),
          body: pantallas[_indiceSeleccionado],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF10B981),
            unselectedItemColor: const Color(0xFF64748B),
            currentIndex: _indiceSeleccionado,
            onTap: _cambiar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Jornada',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: 'Resultados',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Clasificación',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ],
    );
  }
}