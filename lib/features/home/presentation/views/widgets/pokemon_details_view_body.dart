import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/models/description_model/description_model.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
import 'package:pokedex/core/widgets/custom_cached_network_image.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonDetailsViewBody extends StatelessWidget {
  const PokemonDetailsViewBody({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = pokemonHive.toPokemonModel();
    final DescriptionModel pokemonDesc = pokemonHive.toDescriptionModel();
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomAppBar(
          title: pokemonHive.name,
          titleColor: ConstantColors.kWhiteTextColor,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 10,
                child: SizedBox(
                  width: screenWidth * 0.60,
                  child: FittedBox(
                    child: Text(
                      pokemonHive.id.toString().padLeft(3, '0'),
                      style: TextStyle(color: ConstantColors.kWhiteTextColor),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -10,
                child: CustomCachedNetworkImage(
                  height: screenHeight * 0.70,
                  pokemonImage:
                      pokemon.sprites?.other?.officialArtwork!.frontDefault ??
                      '',
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.13,
                left: 6,
                child: PokemonTypeIcon(
                  pokemonType: convertPokemonType(
                    pokemon.types!.first.type!.name!,
                  ),
                  iconSize: 23,
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.14,
                left: 65,
                child: SizedBox(
                  width: screenWidth * 0.45,
                  child: FittedBox(
                    child: Text(
                      softWrap: true,
                      pokemonDesc.genera![7].genus ?? "Unknown",
                      style: TextStyle(color: ConstantColors.kWhiteTextColor),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 4,
                right: 4,
                child: FittedBox(
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.12,
                    child: Text(
                      softWrap: true,
                      cleanText(
                        pokemonDesc.flavorTextEntries?[1].flavorText ??
                            "Unknown",
                      ),
                      style: TextStyle(color: ConstantColors.kWhiteTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
