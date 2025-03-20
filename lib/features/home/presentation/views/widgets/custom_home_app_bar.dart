import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/app_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/pokebola-blanca.png',
            width: 50,
            height: 50,
            // color: PokemonType.fire.foregroundColor,
            color: const Color(0xffEE8329),
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
