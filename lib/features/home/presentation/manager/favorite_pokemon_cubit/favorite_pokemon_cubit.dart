import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

part 'favorite_pokemon_state.dart';

class FavoritePokemonCubit extends Cubit<FavoritePokemonState> {
  FavoritePokemonCubit(this.homeRepo, this.pokemonBox)
    : super(FavoritePokemonInitial());

  final HomeRepo homeRepo;
  final Box<PokemonModel> pokemonBox;

  Future<void> getFavoritePokemon(int id) async {
    if (pokemonBox.containsKey(id)) {
      final cachedPokemon = pokemonBox.get(id);
      emit(FavoritePokemonSuccess(cachedPokemon!));
      return;
    }

    emit(FavoritePokemonLoading());
    final result = await homeRepo.getFavoritePokemon(id: id);

    result.fold(
      (failure) => emit(FavoritePokemonError(failure.message)),
      (pokemon) => emit(FavoritePokemonSuccess(pokemon)),
    );
  }
}
