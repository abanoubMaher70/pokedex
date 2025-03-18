import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({super.key, required this.pokemonType});

  final String pokemonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: getPokemonTypeColor(pokemonType),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/images/pokemons_types/$pokemonType.png',
        height: 23,
      ),
    );
  }
}
