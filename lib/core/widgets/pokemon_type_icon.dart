import 'package:flutter/material.dart';

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Color(0xffEC6C00),
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/images/pokemons_types/fire.png', height: 23),
    );
  }
}
