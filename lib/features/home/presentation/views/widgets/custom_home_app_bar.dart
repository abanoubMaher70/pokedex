import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/assets.dart';

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
