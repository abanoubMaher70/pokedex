import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/models/description_model/description_model.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/widgets/custom_cached_network_image.dart';

class FavoritePokemonCard extends StatelessWidget {
  const FavoritePokemonCard({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = pokemonHive.toPokemonModel();
    final DescriptionModel pokemonDesc = pokemonHive.toDescriptionModel();

    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouter.kPokemonDetailsView, extra: pokemonHive),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: BoxDecoration(
          color: Color(pokemonHive.palette!),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                child: Text(
                  pokemonDesc.names
                          ?.where((n) => n.language!.name == 'ja')
                          .first
                          .name ??
                      "Unknown",
                  style: TextStyle(color: ConstantColors.kWhiteTextColor),
                ),
              ),
            ),
            SizedBox.expand(
              child: CustomCachedNetworkImage(
                pokemonImage:
                    pokemon.sprites!.other!.officialArtwork!.frontDefault!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
