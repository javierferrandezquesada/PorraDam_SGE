import 'package:flutter/material.dart';
import 'package:ui_estructura_espacios_flutter/features/bienvenida/pantalla_bienvenida.dart';
import 'package:ui_estructura_espacios_flutter/features/principal/pantalla_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PORRA DAM',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color.fromARGB(255,85,221,102))),
      home: Scaffold(
        body: PantallaPrincipal()

        ),
      );
  }
}

