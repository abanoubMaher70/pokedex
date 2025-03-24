import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/core/utils/palette_generator.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService;
  final HiveService hiveService;

  HomeRepoImpl(this.apiService, this.hiveService);

  @override
  Future<Either<Failure, PokemonModelHive>> getPokemon({
    required int id,
  }) async {
    return await _getFromCacheOrFetch(id);
  }

  Future<Either<Failure, PokemonModelHive>> _getFromCacheOrFetch(int id) async {
    try {
      // Check cache first
      final cachedPokemon = hiveService.box.get(id);
      if (cachedPokemon != null) return right(cachedPokemon);

      // Fetch data from API
      final responses = await Future.wait([
        apiService.get(endPoint: 'pokemon/$id/'),
        apiService.get(endPoint: 'pokemon-species/$id/'),
      ]);

      final pokemonData = responses[0];
      final speciesData = responses[1];

      final pokemon = PokemonModel.fromJson(pokemonData);
      final palette = await PaletteGeneratorUtil.getPalette(
        pokemon.sprites?.other?.officialArtwork?.frontDefault ?? '',
      );

      final pokemonHive = PokemonModelHive.fromApiModel(
        pokemon,
      ).copyWith(jsonDescData: jsonEncode(speciesData), palette: palette);

      await hiveService.save(pokemon.id!, pokemonHive);

      return right(pokemonHive);
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
