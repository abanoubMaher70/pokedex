import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Row(
          spacing: 8,
          children: [
            Icon(Icons.grass, color: Colors.white, size: 20),
            Icon(Icons.wind_power, color: Colors.white, size: 20),

            // Text(
            //   text,
            //   softWrap: true,
            //   overflow: TextOverflow.ellipsis,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
