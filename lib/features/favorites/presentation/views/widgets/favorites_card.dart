import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/pokemon_utils.dart';
import 'package:pokedex/core/widgets/custom_cached_network_image.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
    required this.hiveService,
    required this.index,
  });
  final PokemonModelHive hiveService;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = hiveService.toPokemonModel();
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouter.kPokemonDetailsView, extra: hiveService),
      child: Container(
        height: generateHeight(index),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Color(hiveService.palette!),
          borderRadius: BorderRadius.circular(14),
        ),
        child: CustomCachedNetworkImage(
          fit: BoxFit.contain,
          pokemonImage: pokemon.sprites!.frontDefault!,
        ),
      ),
    );
  }
}
