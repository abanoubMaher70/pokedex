import 'package:flutter/material.dart';

class FavoritePokemonCard extends StatelessWidget {
  const FavoritePokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffEE8329),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              child: Text(
                "ゼクロム",
                style: TextStyle(color: Colors.white.withValues(alpha: 0.50)),
              ),
            ),
          ),
          Align(
            child: Image.network(
              // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/6.gif',
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
              fit: BoxFit.cover,
              height: 300,
              filterQuality: FilterQuality.none,
            ),
          ),
        ],
      ),
    );
  }
}
