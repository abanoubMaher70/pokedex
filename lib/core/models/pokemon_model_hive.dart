import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_model_hive.g.dart';

@HiveType(typeId: 0)
class PokemonModel extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? jsonData; // Store entire JSON as a string

  @HiveField(3)
  final String? palette; // Store generated palette

  const PokemonModel({this.id, this.name, this.jsonData, this.palette});

  /// Convert API JSON to model
  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    jsonData: jsonEncode(json), // Save full JSON as a string
  );

  /// Convert model to JSON
  Map<String, dynamic> toJson() => jsonDecode(jsonData ?? '{}');

  /// Update the model to include the generated palette
  PokemonModel copyWithPalette(String generatedPalette) {
    return PokemonModel(
      id: id,
      name: name,
      jsonData: jsonData,
      palette: generatedPalette,
    );
  }

  @override
  List<Object?> get props => [id, name, jsonData, palette];
}
