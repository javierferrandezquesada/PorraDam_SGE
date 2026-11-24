import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bienvenida/providers/alias_provider.dart';
import 'providers/puntos_provider.dart';

class _EntradaClasificacion {
  final String nombre;
  final String inicial;
  final Color colorAvatar;
  final int puntos;
  final bool esUsuario;

  const _EntradaClasificacion({
    required this.nombre,
    required this.inicial,
    required this.colorAvatar,
    required this.puntos,
    this.esUsuario = false,
  });
}

class PantallaClasificacion extends ConsumerWidget {
  const PantallaClasificacion({super.key});

  static const List<_EntradaClasificacion> _rivales = [
    _EntradaClasificacion(
      nombre: 'LUCÍA R.',
      inicial: 'L',
      colorAvatar: Color(0xFFD97706),
      puntos: 24,
    ),
    _EntradaClasificacion(
      nombre: 'PabloDev',
      inicial: 'P',
      colorAvatar: Color(0xFF2563EB),
      puntos: 20,
    ),
    _EntradaClasificacion(
      nombre: 'Nerea_K',
      inicial: 'N',
      colorAvatar: Color(0xFFDB2777),
      puntos: 16,
    ),
    _EntradaClasificacion(
      nombre: 'Hugo M.',
      inicial: 'H',
      colorAvatar: Color(0xFFEA580C),
      puntos: 12,
    ),
    _EntradaClasificacion(
      nombre: 'Aitana',
      inicial: 'A',
      colorAvatar: Color(0xFF9333EA),
      puntos: 10,
    ),
    _EntradaClasificacion(
      nombre: 'xavier.dev',
      inicial: 'X',
      colorAvatar: Color(0xFF0891B2),
      puntos: 8,
    ),
    _EntradaClasificacion(
      nombre: 'Iván G.',
      inicial: 'I',
      colorAvatar: Color(0xFF16A34A),
      puntos: 6,
    ),
    _EntradaClasificacion(
      nombre: 'Sara P.',
      inicial: 'S',
      colorAvatar: Color(0xFF4F46E5),
      puntos: 4,
    ),
    _EntradaClasificacion(
      nombre: 'Dani_804',
      inicial: 'D',
      colorAvatar: Color(0xFFD97706),
      puntos: 2,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String alias = ref.watch(aliasProvider);
    final int misPuntos = ref.watch(puntosTotalesProvider);
    final String inicialUsuario =
    alias.isNotEmpty ? alias[0].toUpperCase() : 'S';

    final List<_EntradaClasificacion> listaOrdenada = [
      ..._rivales,
      _EntradaClasificacion(
        nombre: 'Tú · $alias',
        inicial: inicialUsuario,
        colorAvatar: const Color(0xFF059669),
        puntos: misPuntos,
        esUsuario: true,
      ),
    ]..sort((a, b) => b.puntos.compareTo(a.puntos));

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'Clasificación',
                  style: TextStyle(
                    fontFamily: 'Boldonse',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'General',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 26,
                            child: Text(
                              '#',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Participante',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                          Text(
                            'Puntos',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 12,
                      thickness: 1,
                      color: Color(0xFFF1F5F9),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listaOrdenada.length,
                        itemBuilder: (context, i) {
                          final entrada = listaOrdenada[i];
                          return Column(
                            children: [
                              _FilaClasificacion(
                                posicion: i + 1,
                                nombre: entrada.nombre,
                                inicial: entrada.inicial,
                                colorAvatar: entrada.colorAvatar,
                                puntos: entrada.puntos,
                                esUsuario: entrada.esUsuario,
                                esLider: i == 0,
                              ),
                              if (i < listaOrdenada.length - 1)
                                const Divider(
                                  height: 6,
                                  thickness: 1,
                                  color: Color(0xFFF8FAFC),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilaClasificacion extends StatelessWidget {
  final int posicion;
  final String nombre;
  final String inicial;
  final Color colorAvatar;
  final int puntos;
  final bool esUsuario;
  final bool esLider;

  const _FilaClasificacion({
    required this.posicion,
    required this.nombre,
    required this.inicial,
    required this.colorAvatar,
    required this.puntos,
    this.esUsuario = false,
    this.esLider = false,
  });

  Color _colorFondoPosicion() {
    if (posicion == 1) return const Color(0xFFFEF3C7);
    if (posicion == 2) return const Color(0xFFE2E8F0);
    if (posicion == 3) return const Color(0xFFFFEDD5);
    return Colors.transparent;
  }

  Color _colorTextoPosicion() {
    if (posicion == 1) return const Color(0xFFB45309);
    if (posicion == 2) return const Color(0xFF475569);
    if (posicion == 3) return const Color(0xFFC2410C);
    return const Color(0xFF64748B);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: esUsuario ? const Color(0xFFD1FAE5) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _colorFondoPosicion(),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$posicion',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: _colorTextoPosicion(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorAvatar.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              inicial,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: colorAvatar,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              nombre,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                esUsuario || esLider ? FontWeight.bold : FontWeight.w500,
                color: esUsuario
                    ? const Color(0xFF065F46)
                    : const Color(0xFF1E293B),
              ),
            ),
          ),
          if (esLider) ...[
            const Icon(
              Icons.emoji_events,
              size: 18,
              color: Color(0xFFF59E0B),
            ),
            const SizedBox(width: 10),
          ],
          SizedBox(
            width: 34,
            child: Text(
              '$puntos',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: esUsuario
                    ? const Color(0xFF065F46)
                    : const Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}