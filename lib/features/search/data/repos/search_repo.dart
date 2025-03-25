import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';

abstract class SearchRepo {
  Future<Either<Failure, PokemonModelHive>> searchPokemonById({
    required String id,
  });
}
