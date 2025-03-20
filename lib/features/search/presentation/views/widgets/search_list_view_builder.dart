import 'package:flutter/material.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return PokemonCard(144 + index);
      },
    );
  }
}
