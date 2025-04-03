import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';

abstract class SearchRepo {
  Future<Either<Failure, PokemonModelHive>> searchPokemonById({
    required int id,
  });
}
