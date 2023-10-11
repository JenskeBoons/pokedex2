import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  final List<Pokemon> pokemon;
  const PokemonGrid({Key? key, required this.pokemon}) : super(key: key);

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (width > 1000) {
      crossAxisCount = 5;
    } else if (width > 700) {
      crossAxisCount = 4;
    } else if (width > 450) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      semanticChildCount: 250,
      childAspectRatio: 200 / 244,
      physics: const BouncingScrollPhysics(),
      children: widget.pokemon
          .map(
            (pokemon) => PokemonCard(
              id: pokemon.id,
              name: pokemon.name,
              image: pokemon.img,
            ),
          )
          .toList(),
    );
  }
}
