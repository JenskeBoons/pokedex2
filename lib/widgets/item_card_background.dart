import 'package:flutter/material.dart';

class ItemCardBackground extends StatelessWidget {
  final int id;

  const ItemCardBackground({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          "$id",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
