import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
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

    return Column(
      children: [
        const Center(child: CustomHomeAppBar()),
        Row(
          children: [
            Container(
              width: 175,
              height: 60,
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFEAD8),
                  foregroundColor: Colors.deepOrange,
                  shadowColor: Colors.grey.shade100,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fire', style: TextStyles.textStyle14),
                    const PokemonTypeIcon(pokemonType: 'fire', iconSize: 24),
                  ],
                ),
              ),
            ),

            Container(
              width: 175,
              height: 60,
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                  foregroundColor: Colors.brown.shade900,
                  shadowColor: Colors.grey.shade100,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rock', style: TextStyles.textStyle14),
                    const PokemonTypeIcon(pokemonType: 'rock', iconSize: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
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
