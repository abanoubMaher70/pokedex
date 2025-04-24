import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/widgets/squer_button.dart';
import 'package:pokedex/features/home/presentation/views/widgets/custom_popup_menu.dart';

class PokemonDetailsAppBar extends StatefulWidget {
  const PokemonDetailsAppBar({super.key});

  @override
  State<PokemonDetailsAppBar> createState() => _PokemonDetailsAppBarState();
}

class _PokemonDetailsAppBarState extends State<PokemonDetailsAppBar> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 43,
      right: 8,
      left: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SquerButton.backButton(context),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  isTapped ? IconlyBold.heart : IconlyLight.heart,
                  size: 28,
                  color: isTapped ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isTapped = !isTapped;
                  });
                },
              ),
              const CustomPopupMenu(),
            ],
          ),
        ],
      ),
    );
  }
}
