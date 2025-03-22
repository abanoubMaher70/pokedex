import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/core/utils/palette_generator.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService;
  final Box<PokemonModelHive> pokemonBox;

  HomeRepoImpl(this.apiService, this.pokemonBox);

  @override
  Future<Either<Failure, PokemonModel>> getFavoritePokemon({
    required int id,
  }) async {
    if (pokemonBox.containsKey(id)) {
      final cachedPokemon = pokemonBox.get(id);
      return right(cachedPokemon!.toApiModel());
    }

    try {
      final response = await apiService.get(endPoint: 'pokemon/$id/');
      final pokemon = PokemonModel.fromJson(response);

      final String palette = await PaletteGeneratorUtil.getPalette(
        pokemon.sprites!.frontDefault!,
      );

      final pokemonHive = PokemonModelHive.fromApiModel(
        pokemon,
      ).copyWithPalette(palette);
      await pokemonBox.put(pokemon.id, pokemonHive);

      final updatedPokemon = pokemonBox.get(id);
      return right(updatedPokemon!.toApiModel());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e, stacktrace) {
      log('Unexpected error: $e\n$stacktrace');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonModel>> getPokemon({required int id}) {
    throw UnimplementedError();
  }
}
