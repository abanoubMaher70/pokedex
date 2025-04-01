// import 'package:flutter/material.dart';
// import 'package:pokedex/core/constants/responsive_constant.dart';
// import 'package:pokedex/core/models/pokemon_model_hive.dart';
// import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_view_body.dart';

// class PokemonDetailsView extends StatelessWidget {
//   const PokemonDetailsView({super.key, required this.pokemonHive});

//   final PokemonModelHive pokemonHive;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(pokemonHive.palette!),
//       body: Padding(
//         padding: ResponsiveConstant.pagePadding,
//         child: SafeArea(
//           child: PokemonDetailsViewBody(pokemonHive: pokemonHive),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_details_view_body.dart';

class PokemonDetailsPageView extends StatelessWidget {
  const PokemonDetailsPageView({
    super.key,
    required this.pokemonHive,
    required this.index,
  });

  final PokemonModelHive pokemonHive;
  final int index;

  @override
  Widget build(BuildContext context) {
    final List<PokemonModelHive> pokemonHiveall =
        locator.get<HiveService<PokemonModelHive>>().getAll();

    final PageController pageController = PageController(initialPage: index);

    return PageView.builder(
      controller: pageController,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return PokemonDetailsViewBody(pokemonHive: pokemonHiveall[index]);
      },
      itemCount: pokemonHiveall.length,
    );
  }
}
