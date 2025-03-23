import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonModelHiveAdapter());
}
