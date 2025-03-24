import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/text_styles.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = pokemonHive.toPokemonModel();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 16),
      height: 135,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Color(pokemonHive.palette!),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "#${pokemon.id.toString().padLeft(3, '0')}",
                style: TextStyles.textStyle12.copyWith(
                  color: Colors.white.withValues(alpha: 0.50),
                ),
              ),
              Text(
                pokemon.name!,
                style: TextStyles.textStyle20.copyWith(
                  color: Colors.white.withValues(alpha: 0.50),
                  // color: Colors.black,
                ),
              ),
              // PokemonTypeIcon(
              //   pokemonType: convertPokemonType(
              //     pokemon.types!.first.type!.name!,
              //   ),
              // ),
            ],
          ),
          Positioned(
            right: -20,
            top: -5,
            child: Image.network(
              height: 155,
              filterQuality: FilterQuality.none,
              pokemon.sprites?.other?.officialArtwork?.frontDefault ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
