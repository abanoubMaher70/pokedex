import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';

part 'pokemon_model_hive.g.dart';

@HiveType(typeId: 0)
class PokemonModelHive extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String jsonData;

  @HiveField(3)
  final String? palette;

  const PokemonModelHive({
    required this.id,
    required this.name,
    required this.jsonData,
    this.palette,
  });

  /// Convert API Model to Hive Model
  factory PokemonModelHive.fromApiModel(PokemonModel pokemon) {
    return PokemonModelHive(
      id: pokemon.id ?? 0,
      name: pokemon.name ?? 'Unknown',
      jsonData: jsonEncode(pokemon.toJson()),
    );
  }

  /// Convert Hive Model back to API Model
  PokemonModel toApiModel() {
    return PokemonModel.fromJson(jsonDecode(jsonData) as Map<String, dynamic>);
  }

  /// Update the model to include a generated palette
  PokemonModelHive copyWithPalette(String generatedPalette) {
    return PokemonModelHive(
      id: id,
      name: name,
      jsonData: jsonData,
      palette: generatedPalette,
    );
  }

  @override
  List<Object?> get props => [id, name, jsonData, palette];
}
