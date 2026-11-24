import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/bienvenida/pantalla_bienvenida.dart';
import '../features/bienvenida/providers/alias_provider.dart';
import '../features/clasificacion/pantalla_clasificacion.dart';
import '../features/equipos/pantalla_equipos.dart';
import '../features/jornada/pantalla_jornadas.dart';
import '../features/perfil/pantalla_perfil.dart';
import '../features/principal/pantalla_principal.dart';
import '../features/resultados/pantalla_resultados.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/jornadas',
    redirect: (context, state) {
      final alias = ref.read(aliasProvider);
      final enBienvenida = state.matchedLocation == '/bienvenida';
      if (alias.isEmpty && !enBienvenida) return '/bienvenida';
      if (alias.isNotEmpty && enBienvenida) return '/jornadas';
      return null;
    },
    routes: [
      GoRoute(
        path: '/bienvenida',
        builder: (context, state) => const PantallaBienvenida(),
      ),
      ShellRoute(
        builder: (context, state, child) => PantallaPrincipal(child: child),
        routes: [
          GoRoute(
            path: '/jornadas',
            builder: (context, state) => const PantallaJornadas(),
          ),
          GoRoute(
            path: '/resultados',
            builder: (context, state) => const PantallaResultados(),
          ),
          GoRoute(
            path: '/clasificacion',
            builder: (context, state) => const PantallaClasificacion(),
          ),
          GoRoute(
            path: '/equipos',
            builder: (context, state) => const PantallaEquipos(),
          ),
          GoRoute(
            path: '/perfil',
            builder: (context, state) => const PantallaPerfil(),
          ),
        ],
      ),
    ],
  );
});