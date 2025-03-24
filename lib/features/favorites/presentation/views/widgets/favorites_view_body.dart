import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const MasonryGridExample();
  }
}

class MasonryGridExample extends StatefulWidget {
  const MasonryGridExample({super.key});

  @override
  State<MasonryGridExample> createState() => _MasonryGridExampleState();
}

class _MasonryGridExampleState extends State<MasonryGridExample> {
  final List<int> heights = [100, 200, 150, 250, 180, 220, 130, 300];
  Color dominantColor = const Color(0xff394F59);

  final List<PokemonModelHive> hiveService =
      locator.get<HiveService<PokemonModelHive>>().getAll();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'Favorites',
          leading: Icon(IconlyBold.heart, size: 30, color: Colors.red),
        ),
        Expanded(
          child: MasonryGridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
            ),
            itemCount: hiveService.length,
            itemBuilder: (context, index) {
              final PokemonModel pokemon = hiveService[index].toPokemonModel();

              return GestureDetector(
                onTap:
                    () => GoRouter.of(context).push(
                      AppRouter.kPokemonDetailsView,
                      extra: hiveService[index],
                    ),
                child: Container(
                  height: heights[index].toDouble(),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(hiveService[index].palette!),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.network(
                    filterQuality: FilterQuality.none,
                    pokemon.sprites?.frontDefault! ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
