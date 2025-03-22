import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/errors/failuers.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/services/api_services.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, PokemonModel>> getFavoritePokemon({
    required int id,
  }) async {
    try {
      final response = await apiService.get(endPoint: '/pokemon/$id/');
      return right(PokemonModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
