import 'package:flutter/material.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
import 'package:pokedex/features/home/presentation/views/widgets/all_pokemon_list_view_builder.dart';

class AllPokemonsViewBody extends StatelessWidget {
  AllPokemonsViewBody({super.key});

  final List<PokemonModelHive> pokemonList =
      locator.get<HiveService<PokemonModelHive>>().getAll();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'All Pokemons'),
        const SizedBox(height: 8),
        AllPokemonListViewBuilder(pokemonList: pokemonList),
      ],
    );
  }
}
