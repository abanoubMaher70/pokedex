import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PokemonModel>> getFavoritePokemon({required int id});
  Future<Either<Failure, PokemonModel>> getPokemon({required int id});
}
