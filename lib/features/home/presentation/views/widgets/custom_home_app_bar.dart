import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/service_locator.dart';

class CustomHomeAppBar extends StatelessWidget {
  CustomHomeAppBar({super.key});

  final PokemonModelHive? hiveService = locator
      .get<HiveService<PokemonModelHive>>()
      .get(6);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/pokebola-blanca.png',
            width: 50,
            height: 50,
            color: Color(hiveService!.palette!),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(IconlyLight.search),
                iconSize: 30,
                onPressed:
                    () => GoRouter.of(context).push(AppRouter.kSearchView),
              ),
              IconButton(
                icon: const Icon(IconlyLight.heart),
                iconSize: 30,
                onPressed:
                    () => GoRouter.of(context).push(AppRouter.kFavoritesView),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
