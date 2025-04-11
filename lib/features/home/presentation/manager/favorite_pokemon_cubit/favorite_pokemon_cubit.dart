import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

part 'favorite_pokemon_state.dart';

class FavoritePokemonCubit extends Cubit<FavoritePokemonState> {
  FavoritePokemonCubit(this.homeRepo) : super(FavoritePokemonInitial());

  final HomeRepo homeRepo;

  Future<void> getFavoritePokemon({required int id}) async {
    emit(FavoritePokemonLoading());
    final result = await homeRepo.getPokemon(id: id);
    result.fold(
      (failure) => emit(FavoritePokemonError(failure.message)),
      (pokemon) => emit(FavoritePokemonSuccess(pokemon)),
    );
  }

  Future<void> getRandomPokemon() async {
    emit(FavoritePokemonLoading());
    int randomId = Random().nextInt(1000) + 1;
    final result = await homeRepo.getPokemon(id: randomId);
    result.fold(
      (failure) => emit(FavoritePokemonError(failure.message)),
      (pokemon) => emit(FavoritePokemonSuccess(pokemon)),
    );
  }

  // void _fetchRandomPokemon(BuildContext context) async {
  //   var homeRepo = locator.get<HomeRepoImpl>();
  //
  //   Either<Failure, PokemonModelHive> result = await homeRepo.getPokemon(
  //     id: randomId,
  //   );
  //   result.fold(
  //     (failure) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.red,
  //           behavior: SnackBarBehavior.floating,
  //           content: Text(
  //             "Failed to fetch Pokémon: ${failure.message}",
  //             style: TextStyles.textStyle12,
  //           ),
  //         ),
  //       );
  //     },
  //     (pokemon) {
  //       GoRouter.of(context).push(AppRouter.kPokemonDetailsView, extra: pokemon);
  //     },
  //   );
  // }
}
