import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/features/home/data/repos/home_repo_impl.dart';
import 'package:pokedex/features/home/presentation/views/widgets/home_function_card.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeFunctionCard(
      title: 'Random',
      color: Colors.red,
      onTap: () => _fetchRandomPokemon(context),
    );
  }
}

void _fetchRandomPokemon(BuildContext context) async {
  var homeRepo = locator.get<HomeRepoImpl>();
  int randomId = Random().nextInt(1200) + 1;
  Either<Failure, PokemonModelHive> result = await homeRepo.getPokemon(
    id: randomId,
  );
  result.fold(
    (failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Failed to fetch Pokémon: ${failure.message}",
            style: TextStyles.textStyle12,
          ),
        ),
      );
    },
    (pokemon) {
      GoRouter.of(context).push(AppRouter.kPokemonDetailsView, extra: pokemon);
    },
  );
}
