import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/favorites/presentation/views/widgets/favorites_card.dart';

class MasonryGridViewBody extends StatelessWidget {
  const MasonryGridViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PokemonModelHive> hiveService =
        locator.get<HiveService<PokemonModelHive>>().getAll();

    return Expanded(
      child: MasonryGridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: hiveService.length,
        itemBuilder: (context, index) {
          return FavoritesCard(hiveService: hiveService[index], index: index);
        },
      ),
    );
  }
}
