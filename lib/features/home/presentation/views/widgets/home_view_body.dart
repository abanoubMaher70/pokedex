import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/features/home/presentation/manager/favorite_pokemon_cubit/favorite_pokemon_cubit.dart';
import 'package:pokedex/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:pokedex/features/home/presentation/views/widgets/favorite_pokemon_card.dart';
import 'package:pokedex/features/home/presentation/views/widgets/home_function_card.dart';
import 'package:pokedex/features/home/presentation/views/widgets/random_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryHomeTheme);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHomeAppBar(),
        const Text("Your Pokemon"),
        const SizedBox(height: 4),
        BlocBuilder<FavoritePokemonCubit, FavoritePokemonState>(
          builder: (context, state) {
            if (state is FavoritePokemonLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritePokemonSuccess) {
              return FavoritePokemonCard(pokemonHive: state.pokemon);
            } else if (state is FavoritePokemonError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("No Pokemon Found"));
            }
          },
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            const RandomCard(),
            HomeFunctionCard(
              title: 'All Pokemons',
              color: Colors.green,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
