import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';
import 'package:pokedex/core/constants/colors_constant.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(kPrimaryHomeTheme);
    });

    return const Column(children: [PokemonCard()]);
  }
}
