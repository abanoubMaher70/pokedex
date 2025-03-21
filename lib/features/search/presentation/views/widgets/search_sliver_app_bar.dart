import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/custom_text_field.dart';
import 'package:pokedex/core/widgets/squer_button.dart';

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
      title: Text('Pokedex search', style: TextStyles.textStyle14),
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
          ),
        ),
      ),
    );
  }
}
