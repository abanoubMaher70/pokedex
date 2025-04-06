import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_type.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({super.key, required this.pokemonType, this.iconSize});

  final PokemonType pokemonType;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final iconSize = this.iconSize ?? 18;
    final foregroundColor = getPokemonForegroundColor(pokemonType);

    return Container(
      padding: EdgeInsets.all(iconSize - 14),
      decoration: BoxDecoration(color: foregroundColor, shape: BoxShape.circle),
      child: SizedBox(
        height: iconSize,
        child: Image.asset(
          'assets/images/pokemons_types/${pokemonType.name}.png',
        ),
      ),
    );
  }
}
