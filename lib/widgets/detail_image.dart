import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final int id;
  final String image;

  const DetailImage({
    Key? key,
    required this.image,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 1000,
              width: 1000,
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
            ),
            Hero(
              tag: "image-$id",
              child: Center(
                child: Transform.scale(
                  scale: 4, // Adjust the scale factor as needed
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
