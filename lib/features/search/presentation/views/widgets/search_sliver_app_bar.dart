import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/custom_text_field.dart';
import 'package:pokedex/core/widgets/squer_button.dart';
import 'package:pokedex/features/search/presentation/manager/search_cubit/search_cubit.dart';

class SearchSliverAppBar extends StatelessWidget {
  const SearchSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: SquerButton.backButton(context),
      pinned: true,
      floating: true,
      elevation: 0,
      expandedHeight: 130,
      title: Text('Pokédex search', style: TextStyles.textStyle14),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: const Color(0xffFEF7FF),
          child: CustomTextField(
            hintText: 'Search about any pokemon',
            hintStyle: TextStyles.textStyle12.copyWith(fontSize: 11),
            suffix: const Icon(IconlyLight.search),
            textStyle: TextStyles.textStyle14,
            fillColor: Colors.white,
            keyboardType: TextInputType.number,
            onChanged: (p0) {
              if (p0.isNotEmpty) {
                context.read<SearchCubit>().searchPokemonById(
                  id: int.parse(p0),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
