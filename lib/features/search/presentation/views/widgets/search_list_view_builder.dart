import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class SearchListViewBuilder extends StatelessWidget {
  SearchListViewBuilder({super.key});

  final List<PokemonModelHive> hiveService =
      locator.get<HiveService<PokemonModelHive>>().getAll();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: hiveService.length,
      itemBuilder: (context, index) {
        return PokemonCard(pokemonHive: hiveService[index]);
      },
    );
  }
}
