import 'package:flutter/material.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class AllPokemonListViewBuilder extends StatelessWidget {
  const AllPokemonListViewBuilder({super.key, required this.pokemonList});

  final List<PokemonModelHive> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return PokemonCard(pokemonHive: pokemonList[index]);
        },
      ),
    );
  }
}
