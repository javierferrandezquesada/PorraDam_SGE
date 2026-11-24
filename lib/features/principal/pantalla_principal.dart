import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../clasificacion/providers/puntos_provider.dart';

class PantallaPrincipal extends ConsumerWidget {
  final Widget child;

  const PantallaPrincipal({
    super.key,
    required this.child,
  });

  static const List<String> _rutas = [
    '/jornadas',
    '/resultados',
    '/clasificacion',
    '/equipos',
    '/perfil',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int puntosTotales = ref.watch(puntosTotalesProvider);
    final String rutaActual = GoRouterState.of(context).uri.path;
    final int indiceEncontrado = _rutas.indexWhere(rutaActual.startsWith);
    final int indiceSeleccionado = indiceEncontrado < 0 ? 0 : indiceEncontrado;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/fondo_pantalla_hd.webp',
          fit: BoxFit.cover,
        ),
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
                child: Text(
                  '$puntosTotales pts',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF065F46),
                  ),
                ),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF10B981),
            unselectedItemColor: const Color(0xFF64748B),
            selectedFontSize: 11,
            unselectedFontSize: 11,
            currentIndex: indiceSeleccionado,
            onTap: (i) => context.go(_rutas[i]),
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
                icon: Icon(Icons.shield_outlined),
                label: 'Equipos',
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