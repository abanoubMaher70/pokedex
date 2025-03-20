import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:pokedex/features/search/presentation/views/widgets/pokemon_type_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryHomeTheme);
    });

    return const Column(
      children: [
        CustomHomeAppBar(),
        PokemonTypeButton(pokemonType: PokemonType.flying),
      ],
    );
  }
}
