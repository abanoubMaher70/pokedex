import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';

part 'favorite_pokemon_state.dart';

class FavoritePokemonCubit extends Cubit<FavoritePokemonState> {
  FavoritePokemonCubit() : super(FavoritePokemonInitial());

  void addFavoritePokemon(PokemonModel pokemon) {
    emit(FavoritePokemonSuccess(pokemon));
  }
}
