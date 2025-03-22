import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';

abstract class HomeRepo {
  Future<Either<Failure, PokemonModelHive>> getPokemon({required int id});
}
