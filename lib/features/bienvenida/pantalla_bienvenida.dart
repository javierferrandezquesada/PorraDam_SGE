import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/alias_provider.dart';

class PantallaBienvenida extends ConsumerStatefulWidget {
  const PantallaBienvenida({super.key});

  @override
  ConsumerState<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends ConsumerState<PantallaBienvenida> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _grupoController = TextEditingController();

  @override
  void dispose() {
    _aliasController.dispose();
    _grupoController.dispose();
    super.dispose();
  }

  void _entrarEnLaPorra() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(aliasProvider.notifier).cambiar(_aliasController.text);
    context.go('/jornadas');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/fondo_pantalla_hd.webp',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  const Row(
                    children: [
                      Text(
                        'Porra ',
                        style: TextStyle(
                          fontFamily: 'Boldonse',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'DAM',
                        style: TextStyle(
                          fontFamily: 'Boldonse',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA2E8DD),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Pronostica los partidos de cada jornada\ny compite con tu clase.\n¿Quién acertará más?',
                    style: TextStyle(
                      fontFamily: 'HostGrotesk',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'TU ALIAS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              controller: _aliasController,
                              validator: (valor) {
                                if (valor == null || valor.trim().isEmpty) {
                                  return 'Introduce tu nombre o alias para entrar';
                                }
                                if (valor.trim().length < 2) {
                                  return 'El alias debe tener al menos 2 caracteres';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Escribe tu nombre o alias',
                                prefixIcon: const Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'CÓDIGO DEL GRUPO',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              controller: _grupoController,
                              decoration: InputDecoration(
                                hintText: 'p. ej. 1A - DAM - 2026',
                                prefixIcon: const Icon(Icons.people_outline),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _entrarEnLaPorra,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Entrar en la porra',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ],
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