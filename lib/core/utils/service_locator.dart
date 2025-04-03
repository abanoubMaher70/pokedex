import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/core/constants/hive_boxs_constant.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/core/services/hive_service.dart';
import 'package:pokedex/core/services/network/api_services.dart';
import 'package:pokedex/features/home/data/repos/home_repo_impl.dart';
import 'package:pokedex/features/search/data/repos/search_repo_impl.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  final hiveService = HiveService<PokemonModelHive>();

  await hiveService.initHive(
    boxName: kPokemonBox,
    registerAdapters: () {
      Hive.registerAdapter(PokemonModelHiveAdapter());
    },
  );

  // Register HiveService
  locator.registerSingleton<HiveService<PokemonModelHive>>(hiveService);

  // Register Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // Register ApiServices
  locator.registerLazySingleton<ApiServices>(() => ApiServices(locator<Dio>()));

  // Register HomeRepoImpl
  locator.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      locator<ApiServices>(),
      locator<HiveService<PokemonModelHive>>(),
    ),
  );

  // Register HomeRepoImpl
  locator.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(
      locator<ApiServices>(),
      locator<HiveService<PokemonModelHive>>(),
    ),
  );
}
