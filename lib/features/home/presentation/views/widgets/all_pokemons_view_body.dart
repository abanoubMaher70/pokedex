import 'package:flutter/material.dart';

import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class AllPokemonsViewBody extends StatelessWidget {
  AllPokemonsViewBody({super.key});

  final List<PokemonModelHive> hiveService =
      locator.get<HiveService<PokemonModelHive>>().getAll();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'All Pokemons'),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: hiveService.length,
            itemBuilder: (context, index) {
              return PokemonCard(pokemonHive: hiveService[index]);
            },
          ),
        ),
      ],
    );
  }
}
