import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';
import 'package:pokedex/features/favorites/presentation/views/widgets/masonry_grid_view_body.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Your Collection',
          leading: Icon(IconlyBold.heart, size: 30, color: Colors.red),
        ),
        MasonryGridViewBody(),
      ],
    );
  }
}
