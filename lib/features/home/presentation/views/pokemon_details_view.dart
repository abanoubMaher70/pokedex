import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_view_body.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(pokemonHive.palette!),
      body: Padding(
        padding: ResponsiveConstant.pagePadding,
        child: SafeArea(
          child: PokemonDetailsViewBody(pokemonHive: pokemonHive),
        ),
      ),
    );
  }
}
