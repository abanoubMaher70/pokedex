import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/core/utils/palette_generator.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService = locator<ApiServices>();
  final Box<PokemonModelHive> pokemonBox = locator<Box<PokemonModelHive>>();

  HomeRepoImpl(ApiServices apiServices, Box<PokemonModelHive> box);

  @override
  Future<Either<Failure, PokemonModelHive>> getPokemon({
    required int id,
  }) async {
    try {
      if (pokemonBox.containsKey(id)) {
        final cachedPokemon = pokemonBox.get(id);
        return right(cachedPokemon!);
      }

      final response = await apiService.get(endPoint: 'pokemon/$id/');
      final pokemon = PokemonModel.fromJson(response);

      final paletteFuture = PaletteGeneratorUtil.getPalette(
        pokemon.sprites!.frontDefault!,
      );

      final pokemonHive = PokemonModelHive.fromApiModel(pokemon);
      await pokemonBox.put(pokemon.id, pokemonHive);

      final palette = await paletteFuture;
      final updatedPokemonHive = pokemonHive.copyWithPalette(palette);
      await pokemonBox.put(pokemon.id, updatedPokemonHive);

      return right(updatedPokemonHive);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e, stacktrace) {
      log('Unexpected error: $e\n$stacktrace');
      return left(ServerFailure(e.toString()));
    }
  }
}
