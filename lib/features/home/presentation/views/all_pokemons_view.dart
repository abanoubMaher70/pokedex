import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/features/home/presentation/views/widgets/all_pokemons_view_body.dart';

class AllPokemonsView extends StatelessWidget {
  const AllPokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ResponsiveConstant.pagePadding,
          child: AllPokemonsViewBody(),
        ),
      ),
    );
  }
}
