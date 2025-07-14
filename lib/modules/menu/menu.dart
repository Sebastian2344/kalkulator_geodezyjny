import 'package:flutter/material.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/menu/menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 24, 2),
        title: const Text(
          'Program Geodezyjny',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: const ColoredBox(
        color: Color.fromARGB(255, 104, 108, 104),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuButton(
                  nextPage: '/biegunowa', buttonText: 'Metoda Biegunowa'),
              MenuButton(
                  nextPage: '/ortogonalna', buttonText: 'Metoda Ortogonalna'),
              MenuButton(nextPage: '/kat', buttonText: 'Wcięcie Kątowe'),
              MenuButton(
                  nextPage: '/linia', buttonText: 'Wcięcie Liniowe'),
            ],
          ),
        ),
      ),
    );
  }
}