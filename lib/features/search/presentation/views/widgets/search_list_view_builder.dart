import 'package:flutter/material.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return PokemonCard(24 + index);
        },
      ),
    );
  }
}
