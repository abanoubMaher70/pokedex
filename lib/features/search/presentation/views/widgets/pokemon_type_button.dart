import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokemon_type_constant.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonTypeButton extends StatelessWidget {
  const PokemonTypeButton({super.key, required this.pokemonType});

  final PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: pokemonType.backgroundColor,
          foregroundColor: pokemonType.foregroundColor,
          shadowColor: Colors.grey.shade100,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                pokemonType.name.toUpperCase(),
                style: TextStyles.textStyle12,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            PokemonTypeIcon(pokemonType: pokemonType, iconSize: 22),
          ],
        ),
      ),
    );
  }
}
