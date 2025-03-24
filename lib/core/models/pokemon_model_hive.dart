import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/description_model/description_model.dart';
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
  final String? jsonDescData;

  @HiveField(4)
  final int? palette;

  const PokemonModelHive({
    required this.id,
    required this.name,
    required this.jsonData,
    this.jsonDescData,
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
  PokemonModel toPokemonModel() {
    return PokemonModel.fromJson(jsonDecode(jsonData) as Map<String, dynamic>);
  }

  /// Convert Hive Model back to Description API Model
  DescriptionModel toDescriptionModel() {
    return DescriptionModel.fromJson(
      jsonDecode(jsonDescData!) as Map<String, dynamic>,
    );
  }

  /// Update the model with palette and description data
  PokemonModelHive copyWith({
    int? id,
    String? name,
    String? jsonData,
    String? jsonDescData,
    int? palette,
  }) {
    return PokemonModelHive(
      id: id ?? this.id,
      name: name ?? this.name,
      jsonData: jsonData ?? this.jsonData,
      jsonDescData: jsonDescData ?? this.jsonDescData,
      palette: palette ?? this.palette,
    );
  }

  @override
  List<Object?> get props => [id, name, jsonData, jsonDescData, palette];
}
