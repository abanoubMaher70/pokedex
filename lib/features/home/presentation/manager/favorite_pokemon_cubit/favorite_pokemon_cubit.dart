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
}
