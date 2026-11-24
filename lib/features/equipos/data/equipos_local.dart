import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/equipo.dart';

Future<List<Equipo>> cargarEquipos() async {
  final texto = await rootBundle.loadString('assets/datos/equipos.json');
  final lista = jsonDecode(texto) as List;
  return lista
      .map((e) => Equipo.fromJson(e as Map<String, dynamic>))
      .toList();
}