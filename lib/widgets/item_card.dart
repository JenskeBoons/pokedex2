import 'package:flutter/material.dart';
import 'package:pokedex/models/item_screen_data.dart';
import 'package:pokedex/widgets/item_card_background.dart';
import 'package:pokedex/widgets/item_card_data.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const ItemCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  BoxDecoration getContainerDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        enableFeedback: true,
        splashColor: Colors.red[50],
        onTap: () {
          Navigator.pushNamed(
            context,
            "/item_details", // Change this to the correct route for item details
            arguments: ItemScreenData(id, name, image),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              ItemCardBackground(id: id),
              ItemCardData(name: name, image: image),
            ],
          ),
        ),
      ),
    );
  }
}
