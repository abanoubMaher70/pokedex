import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';
import 'package:pokedex/core/widgets/custom_cached_network_image.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

class PokemonDetailsViewBody extends StatelessWidget {
  const PokemonDetailsViewBody({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Color(pokemonHive.palette!),
      body: SafeArea(
        child: Padding(
          padding: ResponsiveConstant.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    buildPokemonName(screenWidth),
                    buildPokemonID(screenWidth),
                    buildPokemonImage(screenHeight),
                    buildPokemonTypeInformation(screenWidth, screenHeight),
                    buildPokemonDescription(screenWidth, screenHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Displays Pokémon Name
  Widget buildPokemonName(double screenWidth) {
    return Positioned(
      top: 10,
      child: SizedBox(
        child: FittedBox(
          child: Text(
            pokemonHive.name.toUpperCase(),
            style: TextStyle(color: ConstantColors.kWhiteTextColor),
          ),
        ),
      ),
    );
  }

  /// Displays Pokémon ID
  Widget buildPokemonID(double screenWidth) {
    return Positioned(
      top: 40,
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
      top: 75,
      child: CustomCachedNetworkImage(
        height: screenHeight * 0.65,

        ///pixel art
        // pokemonImage: pokemonHive.toPokemonModel().sprites?.frontDefault ?? '',
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
      child: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Evolve button
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: PokemonType.evolve.foregroundColor,
            //     foregroundColor: PokemonType.evolve.backgroundColor,
            //   ),
            //   onPressed: () {},
            //   child: const Row(
            //     children: [
            //       PokemonTypeIcon(
            //         pokemonType: PokemonType.evolve,
            //         iconSize: 25,
            //       ),
            //       Text("Evolve"),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 12),
            Row(
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
          ],
        ),
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
