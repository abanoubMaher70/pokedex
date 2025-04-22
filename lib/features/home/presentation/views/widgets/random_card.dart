import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/presentation/manager/favorite_pokemon_cubit/favorite_pokemon_cubit.dart';
import 'package:pokedex/features/home/presentation/views/widgets/home_function_card.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeFunctionCard(
      title: 'Random',
      color: Colors.red,
      onTap:
          () =>
              BlocProvider.of<FavoritePokemonCubit>(context).getRandomPokemon(),
    );
  }
}
