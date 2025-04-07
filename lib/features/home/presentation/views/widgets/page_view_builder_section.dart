import 'package:flutter/material.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_view_body.dart';

class PageViewBuilderSection extends StatelessWidget {
  const PageViewBuilderSection({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final List<PokemonModelHive> pokemonHiveall =
        locator.get<HiveService<PokemonModelHive>>().getAll();

    final int initialIndex = pokemonHiveall.indexWhere(
      (p) => p.id == pokemonHive.id,
    );

    final PageController pageController = PageController(
      initialPage: initialIndex,
    );
    return Positioned.fill(
      child: PageView.builder(
        controller: pageController,
        clipBehavior: Clip.none,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return PokemonDetailsViewBody(pokemonHive: pokemonHiveall[index]);
        },
        itemCount: pokemonHiveall.length,
      ),
    );
  }
}
