import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: 135,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
              const PokemonTypeIcon(),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            height: 170,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
