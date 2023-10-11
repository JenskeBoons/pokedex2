import 'package:flutter/material.dart';
import 'package:pokedex/models/berry_model.dart';
import 'package:pokedex/widgets/berry_card.dart';

class BerryGrid extends StatefulWidget {
  final List<Berry> berries;
  const BerryGrid({Key? key, required this.berries}) : super(key: key);

  @override
  _BerryGridState createState() => _BerryGridState();
}

class _BerryGridState extends State<BerryGrid> {
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
      children: widget.berries.map((berry) => BerryCard(
        id: berry.id,
        name: berry.name,
        image: berry.img,
      )).toList(),
    );
  }
}
