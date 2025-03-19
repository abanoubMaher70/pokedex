import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/constants/pokemon_type_constant.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/assets.dart';
import 'package:pokedex/core/widgets/custom_text_app_bar.dart';
import 'package:pokedex/core/widgets/custom_text_field.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/squer_button.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryHomeTheme);
    });

    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          const Center(child: CustomHomeAppBar()),

          Container(
            width: 175,
            height: 60,
            decoration: const BoxDecoration(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: PokemonType.dark.backgroundColor,
                foregroundColor: PokemonType.dark.foregroundColor,
                shadowColor: Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('dark', style: TextStyles.textStyle12),
                  const PokemonTypeIcon(
                    pokemonType: PokemonType.dark,
                    iconSize: 24,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AssetsImage.pokemonLogoSVG, width: 50, height: 50),

        IconButton(
          icon: const Icon(IconlyLight.search),
          iconSize: 30,
          onPressed: () => GoRouter.of(context).push(AppRouter.kSearchView),
        ),
      ],
    );
  }
}
