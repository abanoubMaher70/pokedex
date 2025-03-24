import 'package:flutter/material.dart';
import 'package:pokedex/features/search/presentation/views/widgets/search_list_view_builder.dart';
import 'package:pokedex/features/search/presentation/views/widgets/search_sliver_app_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [const SearchSliverAppBar(), SearchListViewBuilder()],
    );
  }
}
