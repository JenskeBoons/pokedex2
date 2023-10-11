import 'package:flutter/material.dart';
import 'package:pokedex/models/move_model.dart'; // Import your Move model
import 'package:pokedex/widgets/move_card.dart'; // Import your MoveCard widget

class MoveGrid extends StatefulWidget {
  final List<Move> moves;
  const MoveGrid({Key? key, required this.moves}) : super(key: key);

  @override
  _MoveGridState createState() => _MoveGridState();
}

class _MoveGridState extends State<MoveGrid> {
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
      children: widget.moves.map((move) => MoveCard(
        id: move.id,
        name: move.name,
        image: move.img,
      )).toList(),
    );
  }
}
