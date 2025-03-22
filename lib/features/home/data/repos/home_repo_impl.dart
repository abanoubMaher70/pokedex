import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService;
  final Box<PokemonModel> pokemonBox; // Hive box to store Pokémon

  HomeRepoImpl(this.apiService, this.pokemonBox);

  @override
  Future<Either<Failure, PokemonModel>> getFavoritePokemon({
    required int id,
  }) async {
    try {
      //  1. Check if Pokémon is already in Hive
      if (pokemonBox.containsKey(id)) {
        final cachedPokemon = pokemonBox.get(id);
        return right(cachedPokemon!);
      }

      //  2. If not in Hive, fetch from API
      final response = await apiService.get(endPoint: 'pokemon/$id/');
      final pokemon = PokemonModel.fromJson(response);

      //  3. Save to Hive
      await pokemonBox.put(id, pokemon);

      return right(pokemon);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e, stacktrace) {
      log('Unexpected error: $e\n$stacktrace');
      return left(ServerFailure(e.toString()));
    }
  }
}
