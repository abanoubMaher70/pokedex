import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
import 'package:pokedex/features/home/presentation/views/widgets/page_view_builder_section.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageViewBuilderSection(pokemonHive: pokemonHive),
          Positioned(
            top: 45,
            right: 8,
            left: 8,
            child: CustomAppBar(
              titleColor: ConstantColors.kWhiteTextColor,
              leading: IconButton(
                icon: const Icon(IconlyBold.heart, size: 28, color: Colors.red),
                onPressed: () {},
              ),
              title: '',
            ),
          ),
        ],
      ),
    );
  }
}
