import 'package:flutter/material.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_view_body.dart';

class PokemonDetailsPageView extends StatelessWidget {
  const PokemonDetailsPageView({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final List<PokemonModelHive> pokemonHiveall =
        locator.get<HiveService<PokemonModelHive>>().getAll();

    // Find the correct index of the passed Pokémon
    final int initialIndex = pokemonHiveall.indexWhere(
      (p) => p.id == pokemonHive.id,
    );

    final PageController pageController = PageController(
      initialPage: initialIndex,
    );
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: pageController,
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return PokemonDetailsViewBody(pokemonHive: pokemonHiveall[index]);
      },
      itemCount: pokemonHiveall.length,
    );
  }
}
