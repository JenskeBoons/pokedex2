import 'package:flutter/material.dart';
import 'package:pokedex/models/item_model.dart';
import 'package:pokedex/widgets/item_card.dart';

class ItemGrid extends StatefulWidget {
  final List<Item> items;
  const ItemGrid({Key? key, required this.items}) : super(key: key);

  @override
  _ItemGridState createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
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
      children: widget.items.map((item) => ItemCard(
        id: item.id,
        name: item.name,
        image: item.img,
      )).toList(),
    );
  }
}
