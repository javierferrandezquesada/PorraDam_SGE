import 'package:flutter/material.dart';

class PantallaClasificacion extends StatelessWidget {
  final String alias;

  const PantallaClasificacion({
    super.key,
    this.alias = 'Sin Usuario',
  });

  @override
  Widget build(BuildContext context) {
    final String inicialUsuario =
    alias.isNotEmpty ? alias[0].toUpperCase() : 'S';

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera con título y selector visual estático "General"
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'General',
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

          // Tarjeta blanca con la tabla de clasificación
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
                  // Cabecera de columnas (# | Participante | Puntos)
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

                  const _FilaClasificacion(
                    posicion: 1,
                    nombre: 'LUCÍA R.',
                    inicial: 'L',
                    colorAvatar: Color(0xFFD97706),
                    puntos: 45,
                    esLider: true,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 2,
                    nombre: 'PabloDev',
                    inicial: 'P',
                    colorAvatar: Color(0xFF2563EB),
                    puntos: 41,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 3,
                    nombre: 'Nerea_K',
                    inicial: 'N',
                    colorAvatar: Color(0xFFDB2777),
                    puntos: 40,
                  ),
                  const SizedBox(height: 4),

                  // Fila resaltada en verde con el alias introducido en Bienvenida
                  _FilaClasificacion(
                    posicion: 4,
                    nombre: 'Tú · $alias',
                    inicial: inicialUsuario,
                    colorAvatar: const Color(0xFF059669),
                    puntos: 38,
                    esUsuario: true,
                  ),
                  const SizedBox(height: 4),

                  const _FilaClasificacion(
                    posicion: 5,
                    nombre: 'Hugo M.',
                    inicial: 'H',
                    colorAvatar: Color(0xFFEA580C),
                    puntos: 35,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 6,
                    nombre: 'Aitana',
                    inicial: 'A',
                    colorAvatar: Color(0xFF9333EA),
                    puntos: 33,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 7,
                    nombre: 'xavier.dev',
                    inicial: 'X',
                    colorAvatar: Color(0xFF0891B2),
                    puntos: 30,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 8,
                    nombre: 'Iván G.',
                    inicial: 'I',
                    colorAvatar: Color(0xFF16A34A),
                    puntos: 27,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 9,
                    nombre: 'Sara P.',
                    inicial: 'S',
                    colorAvatar: Color(0xFF4F46E5),
                    puntos: 26,
                  ),
                  const Divider(
                    height: 6,
                    thickness: 1,
                    color: Color(0xFFF8FAFC),
                  ),

                  const _FilaClasificacion(
                    posicion: 10,
                    nombre: 'Dani_804',
                    inicial: 'D',
                    colorAvatar: Color(0xFFD97706),
                    puntos: 19,
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
    if (posicion == 1) {
      return const Color(0xFFFEF3C7); // Oro suave
    } else if (posicion == 2) {
      return const Color(0xFFE2E8F0); // Plata suave
    } else if (posicion == 3) {
      return const Color(0xFFFFEDD5); // Bronce suave
    } else {
      return Colors.transparent;
    }
  }

  Color _colorTextoPosicion() {
    if (posicion == 1) {
      return const Color(0xFFB45309);
    } else if (posicion == 2) {
      return const Color(0xFF475569);
    } else if (posicion == 3) {
      return const Color(0xFFC2410C);
    } else {
      return const Color(0xFF64748B);
    }
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
          // Columna 1: Posición (#)
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

          // Avatar circular con inicial
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

          // Columna 2: Nombre del participante
          Expanded(
            child: Text(
              nombre,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: esUsuario || esLider
                    ? FontWeight.bold
                    : FontWeight.w500,
                color: esUsuario
                    ? const Color(0xFF065F46)
                    : const Color(0xFF1E293B),
              ),
            ),
          ),

          // Corona si va en primera posición
          if (esLider) ...[
            const Icon(
              Icons.emoji_events,
              size: 18,
              color: Color(0xFFF59E0B),
            ),
            const SizedBox(width: 10),
          ],

          // Columna 3: Puntos
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