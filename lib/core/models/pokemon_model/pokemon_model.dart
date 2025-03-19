import 'package:equatable/equatable.dart';

import 'ability.dart';

import 'held_item.dart';
import 'move.dart';
import 'species.dart';
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';

class PokemonModel extends Equatable {
  final List<Ability>? abilities;
  final int? baseExperience;

  final int? height;
  final List<HeldItem>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final int? weight;

  const PokemonModel({
    this.abilities,
    this.baseExperience,

    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    abilities:
        (json['abilities'] as List<dynamic>?)
            ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
            .toList(),
    baseExperience: json['base_experience'] as int?,

    height: json['height'] as int?,
    heldItems:
        (json['held_items'] as List<dynamic>?)
            ?.map((e) => HeldItem.fromJson(e as Map<String, dynamic>))
            .toList(),
    id: json['id'] as int?,
    isDefault: json['is_default'] as bool?,
    locationAreaEncounters: json['location_area_encounters'] as String?,
    moves:
        (json['moves'] as List<dynamic>?)
            ?.map((e) => Move.fromJson(e as Map<String, dynamic>))
            .toList(),
    name: json['name'] as String?,
    order: json['order'] as int?,
    species:
        json['species'] == null
            ? null
            : Species.fromJson(json['species'] as Map<String, dynamic>),
    sprites:
        json['sprites'] == null
            ? null
            : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    stats:
        (json['stats'] as List<dynamic>?)
            ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
            .toList(),
    types:
        (json['types'] as List<dynamic>?)
            ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
            .toList(),
    weight: json['weight'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'abilities': abilities?.map((e) => e.toJson()).toList(),
    'base_experience': baseExperience,
    'height': height,
    'held_items': heldItems?.map((e) => e.toJson()).toList(),
    'id': id,
    'is_default': isDefault,
    'location_area_encounters': locationAreaEncounters,
    'moves': moves?.map((e) => e.toJson()).toList(),
    'name': name,
    'order': order,
    'species': species?.toJson(),
    'sprites': sprites?.toJson(),
    'stats': stats?.map((e) => e.toJson()).toList(),
    'types': types?.map((e) => e.toJson()).toList(),
    'weight': weight,
  };

  @override
  List<Object?> get props {
    return [
      abilities,
      baseExperience,
      height,
      heldItems,
      id,
      isDefault,
      locationAreaEncounters,
      moves,
      name,
      order,
      species,
      sprites,
      stats,
      types,
      weight,
    ];
  }
}
