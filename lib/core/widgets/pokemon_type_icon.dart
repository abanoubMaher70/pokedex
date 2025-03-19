import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({super.key, required this.pokemonType, this.iconSize});

  final PokemonType pokemonType;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: getPokemonForegroundColor(pokemonType),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/images/pokemons_types/${pokemonType.name}.png',
        height: iconSize ?? 18,
      ),
    );
  }
}
