import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/widgets/pokemon_card.dart';
import 'package:pokedex/features/search/presentation/manager/search_cubit/search_cubit.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is SearchSuccess) {
          return SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PokemonCard(pokemonHive: state.pokemon),
              );
            },
          );
        } else if (state is SearchError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
