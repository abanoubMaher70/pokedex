import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(this.number, {super.key});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.only(bottom: 24),
          height: 135,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffFFEAD8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 4,
            children: [
              Text(
                "#006",
                style: TextStyles.pixelFont20.copyWith(
                  color: const Color(0xffEC6C00),
                  fontSize: 12,
                ),
              ),
              Text(
                "chermander",
                style: TextStyles.pixelFont20.copyWith(
                  color: const Color(0xffEC6C00),
                  fontSize: 20,
                ),
              ),
              const PokemonTypeIcon(pokemonType: 'water'),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: -10,
          child: SizedBox(
            height: 160,
            child: Image.network(
              filterQuality: FilterQuality.none,
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
