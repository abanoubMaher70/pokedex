import 'package:flutter/material.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_card.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return PokemonCard(90 + index);
        },
      ),
    );
  }
}
