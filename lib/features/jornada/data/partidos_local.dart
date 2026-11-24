import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/partido.dart';

Future<List<Partido>> cargarPartidos() async {
  final texto = await rootBundle.loadString('assets/datos/partidos.json');
  final lista = jsonDecode(texto) as List;
  return lista
      .map((e) => Partido.fromJson(e as Map<String, dynamic>))
      .toList();
}