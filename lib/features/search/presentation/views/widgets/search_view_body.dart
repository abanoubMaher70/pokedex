import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/custom_text_app_bar.dart';
import 'package:pokedex/core/widgets/custom_text_field.dart';
import 'package:pokedex/features/home/presentation/views/widgets/pokemon_card.dart';
import 'package:pokedex/features/search/presentation/views/widgets/search_list_view_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextAppBar(title: 'Pokedex search'),
        const SizedBox(height: 18),
        CustomTextField(
          hintText: 'Search about any pokemon',
          hintStyle: TextStyles.pixelFont14.copyWith(fontSize: 11),
          suffix: const Icon(IconlyLight.search),
          textStyle: TextStyles.pixelFont14,
        ),
        const SearchListViewBuilder(),
      ],
    );
  }
}
