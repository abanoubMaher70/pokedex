import 'package:flutter/material.dart';

class HomeFunctionCard extends StatelessWidget {
  const HomeFunctionCard({
    super.key,
    this.onTap,
    required this.color,
    required this.title,
  });
  final void Function()? onTap;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 115,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          image: const DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage('assets/images/pokebola-blanca.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
