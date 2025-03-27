import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/home/data/repos/home_repo_impl.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _fetchRandomPokemon(context),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(14),
            image: const DecorationImage(
              image: AssetImage('assets/images/pokebola-blanca.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: const Text("Random"),
        ),
      ),
    );
  }
}

void _fetchRandomPokemon(BuildContext context) async {
  var homeRepo = locator.get<HomeRepoImpl>();
  int randomId = Random().nextInt(1100) + 1;
  Either<Failure, PokemonModelHive> result = await homeRepo.getPokemon(
    id: randomId,
  );
  result.fold(
    (failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch Pokémon: ${failure.message}")),
      );
    },
    (pokemon) {
      GoRouter.of(context).push(AppRouter.kPokemonDetailsView, extra: pokemon);
    },
  );
}
