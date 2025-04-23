import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/custom_cached_network_image.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonHalfWidthCard extends StatelessWidget {
  const PokemonHalfWidthCard({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = pokemonHive.toPokemonModel();
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouter.kPokemonDetailsView, extra: pokemonHive),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.only(bottom: 16),
        height: 120,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(pokemonHive.palette!),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "#${pokemon.id.toString().padLeft(3, '0')}",
                  style: TextStyles.textStyle20.copyWith(
                    color: ConstantColors.kWhiteTextColor,
                  ),
                ),
                Text(
                  pokemon.name!,
                  style: TextStyles.textStyle12.copyWith(
                    color: ConstantColors.kWhiteTextColor,
                  ),
                ),
                PokemonTypeIcon(
                  pokemonType: convertPokemonType(
                    pokemon.types!.first.type!.name!,
                  ),
                  iconSize: 16,
                ),
              ],
            ),
            Positioned(
              right: -30,
              top: -5,
              child: CustomCachedNetworkImage(
                height: 135,
                pokemonImage:
                    pokemon.sprites!.other!.officialArtwork!.frontDefault ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
