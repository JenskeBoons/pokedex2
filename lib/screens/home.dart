import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex.dart';
import 'package:pokedex/screens/moves.dart';
import 'package:pokedex/screens/berries.dart';
import 'package:pokedex/screens/items.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 columns in the grid
        padding: const EdgeInsets.all(16),
        children: [
          _buildGridItem(context, 'Pokedex', const PokeDex(), const Color(0xFFE57373), 'pokeball.png'),
          _buildGridItem(context, 'Moves', const Moves(), const Color(0xFF64B5F6), 'pokeball.png'),
          _buildGridItem(context, 'Berries', const Berries(), const Color(0xFF81C784), 'pokeball.png'),
          _buildGridItem(context, 'Items', const Items(), const Color(0xFFFFD54F), 'pokeball.png'),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, Widget route, Color color, String pokeballImage) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 1,
                child: Image.asset(pokeballImage, width: 180, height: 180), // Enlarge the image
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}