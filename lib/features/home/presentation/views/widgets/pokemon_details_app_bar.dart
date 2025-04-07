import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/widgets/squer_button.dart';

class PokemonDetailsAppBar extends StatelessWidget {
  const PokemonDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 44,
      right: 8,
      left: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SquerButton.backButton(context),
          IconButton(
            icon: const Icon(IconlyBold.heart, size: 28, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
