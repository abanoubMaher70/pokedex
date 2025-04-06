import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: pageController,
              clipBehavior: Clip.none,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return PokemonDetailsViewBody(
                  pokemonHive: pokemonHiveall[index],
                );
              },
              itemCount: pokemonHiveall.length,
            ),
          ),
          Positioned(
            top: 35,
            right: 8,
            left: 8,
            child: CustomAppBar(
              titleColor: ConstantColors.kWhiteTextColor,
              // leading: const Icon(IconlyLight.heart, size: 28),
              leading: IconButton(
                icon: const Icon(IconlyBold.heart, size: 28, color: Colors.red),
                onPressed: () {},
              ),
              title: '',
            ),
          ),
        ],
      ),
    );
  }
}
