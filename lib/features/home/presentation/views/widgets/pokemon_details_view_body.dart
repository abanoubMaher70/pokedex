import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomAppBar(
          title: pokemonHive.name,
          titleColor: ConstantColors.kWhiteTextColor,
          // leading: const Icon(IconlyLight.heart, size: 28),
          leading: const Icon(IconlyBold.heart, size: 28, color: Colors.red),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              buildPokemonID(screenWidth),
              buildPokemonImage(screenHeight),
              buildPokemonTypeInformation(screenWidth, screenHeight),
              buildPokemonDescription(screenWidth, screenHeight),
            ],
          ),
        ),
      ],
    );
  }

  /// Displays Pokémon ID
  Widget buildPokemonID(double screenWidth) {
    return Positioned(
      child: SizedBox(
        width: screenWidth * 0.65,
        child: FittedBox(
          child: Text(
            pokemonHive.id.toString().padLeft(3, '0'),
            style: TextStyle(color: ConstantColors.kWhiteTextColor),
          ),
        ),
      ),
    );
  }

  /// Displays Pokémon Image
  Widget buildPokemonImage(double screenHeight) {
    return Positioned(
      top: -5,
      child: CustomCachedNetworkImage(
        height: screenHeight * 0.70,
        pokemonImage:
            pokemonHive
                .toPokemonModel()
                .sprites
                ?.other
                ?.officialArtwork
                ?.frontDefault ??
            '',
      ),
    );
  }

  /// Displays Pokémon Type Icon
  Widget buildPokemonTypeInformation(double screenWidth, double screenHeight) {
    return Positioned(
      bottom: screenHeight * 0.13,
      left: 6,
      child: Row(
        spacing: 12,
        children: [
          PokemonTypeIcon(
            pokemonType: convertPokemonType(
              pokemonHive.toPokemonModel().types!.first.type!.name!,
            ),
            iconSize: 22.5,
          ),
          SizedBox(
            child: FittedBox(
              child: Text(
                pokemonHive
                        .toDescriptionModel()
                        .genera
                        ?.firstWhere((g) => g.language!.name == 'en')
                        .genus ??
                    "Unknown",
                style: TextStyle(color: ConstantColors.kWhiteTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Pokémon Description
  Widget buildPokemonDescription(double screenWidth, double screenHeight) {
    return Positioned(
      bottom: 0,
      left: 8,
      right: 8,
      child: FittedBox(
        child: SizedBox(
          width: screenWidth * 1.1,
          height: screenHeight * 0.14,
          child: Text(
            cleanText(
              pokemonHive
                      .toDescriptionModel()
                      .flavorTextEntries
                      ?.firstWhere((f) => f.language!.name == 'en')
                      .flavorText ??
                  "Unknown",
            ),
            style: TextStyle(color: ConstantColors.kWhiteTextColor),
          ),
        ),
      ),
    );
  }
}
