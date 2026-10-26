import 'package:flutter/material.dart';

class PantallaBienvenida extends StatelessWidget {
  const PantallaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/fondo_pantalla_hd.webp', fit: BoxFit.cover),

        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 180),

                Row(
                  children: [
                    Text(
                      "Porra ",
                      style: TextStyle(
                        fontFamily: 'Boldonse',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "DAM",
                      style: TextStyle(
                        fontFamily: 'Boldonse',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA2E8DD),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Text(
                  "Pronostica los partidos de cada jornada\ny compite con tu clase.\n¿Quién acertará más?",
                  style: TextStyle(
                    fontFamily: 'HostGrotesk',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TU ALIAS",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Escribe tu nombre o alias",
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 15),
                        Text(
                          "CÓDIGO DEL GRUPO",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "p. ej. 1A - DAM - 2026",
                            prefixIcon: Icon(Icons.people_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Entrar en la porra"),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}