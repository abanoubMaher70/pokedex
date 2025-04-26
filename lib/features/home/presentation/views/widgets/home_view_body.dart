import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/features/home/presentation/manager/favorite_pokemon_cubit/favorite_pokemon_cubit.dart';
import 'package:pokedex/features/home/presentation/views/all_pokemons_view.dart';
import 'package:pokedex/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:pokedex/features/home/presentation/views/widgets/favorite_pokemon_card.dart';
import 'package:pokedex/features/home/presentation/views/widgets/home_function_card.dart';
import 'package:pokedex/features/home/presentation/views/widgets/random_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryHomeTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritePokemonCubit, FavoritePokemonState>(
      listener: (context, state) {
        if (state is FavoritePokemonSuccess) {
          GoRouter.of(
            context,
          ).push(AppRouter.kPokemonDetailsView, extra: state.pokemon);
        }
      },
      builder: (context, state) {
        final isLoading = state is FavoritePokemonLoading;

        return Stack(
          children: [
            // Main UI
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHomeAppBar(),
                  const SizedBox(height: 8),
                  const Text("Your Pokemon"),
                  const SizedBox(height: 4),
                  _buildFavoriteSection(state),
                  const SizedBox(height: 8),
                  _buildHomeFunctionSection(),
                ],
              ),
            ),

            // Loading Overlay
            if (isLoading)
              const Positioned.fill(
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }

  Widget _buildFavoriteSection(FavoritePokemonState state) {
    if (state is FavoritePokemonSuccess) {
      return FavoritePokemonCard(pokemonHive: state.pokemon);
    } else if (state is FavoritePokemonError) {
      return Center(child: Text(state.message));
    } else {
      return const SizedBox(
        height: 400,
        child: Center(child: Text("No Pokemon Found")),
      );
    }
  }

  Widget _buildHomeFunctionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RandomCard(),
        const SizedBox(height: 12),
        HomeFunctionCard(
          title: 'All Pokemons',
          color: Colors.green,
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AllPokemonsView(),
              ),
            );
          },
        ),
      ],
    );
  }
}
