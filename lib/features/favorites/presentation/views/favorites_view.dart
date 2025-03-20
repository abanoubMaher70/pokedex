import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/features/favorites/presentation/views/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: ResponsiveConstant.pagePadding,
        child: SafeArea(child: FavoritesViewBody()),
      ),
    );
  }
}
