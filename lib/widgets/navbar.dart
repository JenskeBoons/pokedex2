import 'package:flutter/material.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/screens/pokedex.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
    Widget build(BuildContext context) {
      return BottomAppBar(
        color: Colors.red, // Match the app bar's color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home()), // Remove 'const'
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.catching_pokemon_rounded, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PokeDex()), // Remove 'const'
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.camera, color: Colors.white),
              onPressed: () {
                // Navigate to your favorite Pokémon
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                // Navigate to the user profile
              },
            ),
          ],
        ),
      );
    }
}