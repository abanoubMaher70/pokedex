import 'package:equatable/equatable.dart';

import 'flavor_text_entry.dart';
import 'genus.dart';
import 'growth_rate.dart';
import 'habitat.dart';
import 'name.dart';
import 'pal_park_encounter.dart';
import 'shape.dart';
import 'variety.dart';

class DescriptionModel extends Equatable {
  final int? baseHappiness;
  final int? captureRate;
  final List<FlavorTextEntry>? flavorTextEntries;
  final int? genderRate;
  final List<Genus>? genera;
  final GrowthRate? growthRate;
  final Habitat? habitat;
  final int? hatchCounter;
  final int? id;
  final bool? isLegendary;
  final bool? isMythical;
  final String? name;
  final List<Name>? names;
  final int? order;
  final List<PalParkEncounter>? palParkEncounters;
  final Shape? shape;
  final List<Variety>? varieties;

  const DescriptionModel({
    this.baseHappiness,
    this.captureRate,
    this.flavorTextEntries,
    this.genderRate,
    this.genera,
    this.growthRate,
    this.habitat,
    this.hatchCounter,
    this.id,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.shape,
    this.varieties,
  });

  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      baseHappiness: json['base_happiness'] as int?,
      captureRate: json['capture_rate'] as int?,
      flavorTextEntries:
          (json['flavor_text_entries'] as List<dynamic>?)
              ?.map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
      genderRate: json['gender_rate'] as int?,
      genera:
          (json['genera'] as List<dynamic>?)
              ?.map((e) => Genus.fromJson(e as Map<String, dynamic>))
              .toList(),
      growthRate:
          json['growth_rate'] == null
              ? null
              : GrowthRate.fromJson(
                json['growth_rate'] as Map<String, dynamic>,
              ),
      habitat:
          json['habitat'] == null
              ? null
              : Habitat.fromJson(json['habitat'] as Map<String, dynamic>),
      hatchCounter: json['hatch_counter'] as int?,
      id: json['id'] as int?,
      isLegendary: json['is_legendary'] as bool?,
      isMythical: json['is_mythical'] as bool?,
      name: json['name'] as String?,
      names:
          (json['names'] as List<dynamic>?)
              ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
              .toList(),
      order: json['order'] as int?,
      palParkEncounters:
          (json['pal_park_encounters'] as List<dynamic>?)
              ?.map((e) => PalParkEncounter.fromJson(e as Map<String, dynamic>))
              .toList(),
      shape:
          json['shape'] == null
              ? null
              : Shape.fromJson(json['shape'] as Map<String, dynamic>),
      varieties:
          (json['varieties'] as List<dynamic>?)
              ?.map((e) => Variety.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'base_happiness': baseHappiness,
    'capture_rate': captureRate,
    'flavor_text_entries': flavorTextEntries?.map((e) => e.toJson()).toList(),
    'gender_rate': genderRate,
    'genera': genera?.map((e) => e.toJson()).toList(),
    'growth_rate': growthRate?.toJson(),
    'habitat': habitat?.toJson(),
    'hatch_counter': hatchCounter,
    'id': id,
    'is_legendary': isLegendary,
    'is_mythical': isMythical,
    'name': name,
    'names': names?.map((e) => e.toJson()).toList(),
    'order': order,
    'pal_park_encounters': palParkEncounters?.map((e) => e.toJson()).toList(),
    'shape': shape?.toJson(),
    'varieties': varieties?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      baseHappiness,
      captureRate,
      flavorTextEntries,
      genderRate,
      genera,
      growthRate,
      habitat,
      hatchCounter,
      id,
      isLegendary,
      isMythical,
      name,
      names,
      order,
      palParkEncounters,
      shape,
      varieties,
    ];
  }
}
