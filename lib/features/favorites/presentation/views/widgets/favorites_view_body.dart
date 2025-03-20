import 'package:flutter/material.dart';
import 'package:pokedex/core/widgets/custom_text_app_bar.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomTextAppBar(title: 'Favorites')]);
  }
}
