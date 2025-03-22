import 'package:hive/hive.dart';

class HiveService {
  static const String _pokemonBox = 'pokemonBox';

  Future<void> savePokemon(String name, Map<String, dynamic> data) async {
    final box = await Hive.openBox(_pokemonBox);
    await box.put(name, data);
  }

  Future<Map<String, dynamic>?> getPokemon(String name) async {
    final box = await Hive.openBox(_pokemonBox);
    return box.get(name);
  }
}
