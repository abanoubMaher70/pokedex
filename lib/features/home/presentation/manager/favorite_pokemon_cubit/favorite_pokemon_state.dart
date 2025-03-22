part of 'favorite_pokemon_cubit.dart';

sealed class FavoritePokemonState extends Equatable {
  const FavoritePokemonState();

  @override
  List<Object> get props => [];
}

final class FavoritePokemonInitial extends FavoritePokemonState {}

final class FavoritePokemonEmpty extends FavoritePokemonState {}

final class FavoritePokemonLoading extends FavoritePokemonState {}

final class FavoritePokemonSuccess extends FavoritePokemonState {
  final PokemonModelHive pokemon;
  const FavoritePokemonSuccess(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

final class FavoritePokemonError extends FavoritePokemonState {
  final String message;
  const FavoritePokemonError(this.message);

  @override
  List<Object> get props => [message];
}
