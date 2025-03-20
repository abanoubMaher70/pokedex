import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(this.number, {super.key});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 16),
      height: 135,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffFFEAD8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "#006",
                style: TextStyles.textStyle12.copyWith(
                  color: const Color(0xffEC6C00),
                ),
              ),
              Text(
                "chermander",
                style: TextStyles.textStyle20.copyWith(
                  color: const Color(0xffEC6C00),
                ),
              ),
              const PokemonTypeIcon(pokemonType: PokemonType.dark),
            ],
          ),

          Positioned(
            right: -20,
            top: -5,
            child: Image.network(
              height: 155,
              filterQuality: FilterQuality.none,
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
