import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            letterSpacing: 1.35,
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
