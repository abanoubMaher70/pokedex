import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/features/home/data/repos/home_repo.dart';
import 'package:pokedex/features/home/data/repos/home_repo_impl.dart';

final GetIt locator = GetIt.instance;
void setupLocator() async {
  // Initialize Hive (if not already initialized)
  await Hive.initFlutter();

  // Open Hive box before registering it
  final pokemonBox = await Hive.openBox<PokemonModelHive>('pokemon_box');

  // Register Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // Register ApiServices
  locator.registerLazySingleton<ApiServices>(() => ApiServices(locator<Dio>()));

  // Register Hive box
  locator.registerSingleton<Box<PokemonModelHive>>(pokemonBox);

  // Register HomeRepo
  locator.registerLazySingleton<HomeRepo>(
    () =>
        HomeRepoImpl(locator<ApiServices>(), locator<Box<PokemonModelHive>>()),
  );
}
