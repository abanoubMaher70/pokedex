import 'package:flutter/material.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/features/home/presentation/views/widgets/page_view_builder_section.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_app_bar.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageViewBuilderSection(pokemonHive: pokemonHive),
          const PokemonDetailsAppBar(),
        ],
      ),
    );
  }
}
