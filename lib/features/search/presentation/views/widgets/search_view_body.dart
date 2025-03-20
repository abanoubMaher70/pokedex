import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/custom_text_app_bar.dart';
import 'package:pokedex/core/widgets/custom_text_field.dart';
import 'package:pokedex/features/search/presentation/views/widgets/search_list_view_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomAppBar(title: 'Pokedex search'),
              const SizedBox(height: 18),
              CustomTextField(
                hintText: 'Search about any pokemon',
                hintStyle: TextStyles.textStyle12.copyWith(fontSize: 11),
                suffix: const Icon(IconlyLight.search),
                textStyle: TextStyles.textStyle14,
                fillColor: Colors.grey[50],
              ),
            ],
          ),
        ),
        const SearchListViewBuilder(),
      ],
    );
  }
}



//const Row(children: [Text("Search by Type")]),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //     child: GridView.builder(
          //       physics: const NeverScrollableScrollPhysics(),
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20,
          //         childAspectRatio: 2.3,
          //       ),
          //       itemCount: 6,
          //       itemBuilder: (context, index) {
          //         return PokemonTypeButton(
          //           pokemonType: PokemonType.values[index],
          //         );
          //       },
          //     ),
          //   ),
          // ),