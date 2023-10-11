import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/API/movesapi.dart'; // Import your moves API
import 'package:pokedex/models/move_model.dart'; // Import your Move model
import 'package:pokedex/widgets/move_grid.dart'; // Import your MoveGrid widget
import 'package:pokedex/widgets/navbar.dart';

class Moves extends StatefulWidget {
  const Moves({Key? key}) : super(key: key);

  @override
  State<Moves> createState() => _MovesState();
}

class _MovesState extends State<Moves> {
  List<Move> moves = List.empty(); // Use the correct type "Move"

  @override
  void initState() {
    super.initState();
    getMovesFromApi();
  }

  void getMovesFromApi() async {
    MoveAPI.getMoves().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        moves = data.asMap().entries.map<Move>((element) { // Use the correct type "Move"
          element.value['id'] = element.key + 1;
          element.value['img'] =
               "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/moves/${element.value['name']}.png";
          return Move.fromJson(element.value); // Use the correct type "Move"
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Search a Move',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: MoveGrid(moves: moves),
      bottomNavigationBar: const NavBar(),
    );
  }
}
