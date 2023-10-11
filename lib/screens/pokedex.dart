import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/widgets/navbar.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/poke_model.dart';
//import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';

class PokeDex extends StatefulWidget {
  const PokeDex({Key? key}) : super(key: key);

  @override
  State<PokeDex> createState() => _HomeState();
}

class _HomeState extends State<PokeDex> {
  List<Pokemon> pokemon = List.empty();
   bool isSearching = false;

  @override
  void initState() {
    super.initState();
    getPokemonFromPokeApi();
  }

  void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${element.key + 1}.gif";
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black, // Search icon color
                  ),
                  SizedBox(width: 8), // Add some spacing
                  Text(
                    'Search a Pokémon',
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      
      body: PokemonGrid(pokemon: pokemon),
      bottomNavigationBar: const NavBar(), 
    );
  }
}