import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/pokemon_type_constant.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/utils/app_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/pokebola.png',
            width: 50,
            height: 50,
            color: PokemonType.flying.foregroundColor,
          ),
          IconButton(
            icon: const Icon(IconlyLight.search),
            iconSize: 30,
            onPressed: () => GoRouter.of(context).push(AppRouter.kSearchView),
          ),
        ],
      ),
    );
  }
}
