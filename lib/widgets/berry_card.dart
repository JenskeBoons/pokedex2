import 'package:flutter/material.dart';
import 'package:pokedex/models/berry_screen_data.dart'; // Update the import to match your "berry" screen data
import 'package:pokedex/widgets/berry_card_background.dart'; // Update the import to match your "berry" card background
import 'package:pokedex/widgets/berry_card_data.dart'; // Update the import to match your "berry" card data

class BerryCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const BerryCard({
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
            "/berry_details", // Change this to the correct route for berry details
            arguments: BerryScreenData(id, name, image), // Update to match your "berry" screen data
          );
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              BerryCardBackground(id: id), // Update to match your "berry" card background
              BerryCardData(name: name, image: image), // Update to match your "berry" card data
            ],
          ),
        ),
      ),
    );
  }
}
