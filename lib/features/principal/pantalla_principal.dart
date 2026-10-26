import 'package:flutter/material.dart';
import 'package:ui_estructura_espacios_flutter/features/bienvenida/pantalla_bienvenida.dart';
import 'package:ui_estructura_espacios_flutter/features/clasificacion/pantalla_clasificacion.dart';
import 'package:ui_estructura_espacios_flutter/features/resultados/pantalla_resultados.dart';
import '../jornada/pantalla_jornadas.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indiceSeleccionado = 0;

  final List<Widget> _pantallas = [
    PantallaJornadas(),
    PantallaResultados(),
    PantallaClasificacion()

  ];

  void _cambiar(int index){
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_indiceSeleccionado],
      bottomNavigationBar:
        BottomNavigationBar(
          currentIndex: _indiceSeleccionado,
          onTap: _cambiar,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Jornadas"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Resultados"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Clasificación"),
          ]
        )
    );
  }
}


