import 'package:equatable/equatable.dart';

import 'pokemon.dart';

class Variety extends Equatable {
  final bool? isDefault;
  final Pokemon? pokemon;

  const Variety({this.isDefault, this.pokemon});

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
    isDefault: json['is_default'] as bool?,
    pokemon:
        json['pokemon'] == null
            ? null
            : Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'is_default': isDefault,
    'pokemon': pokemon?.toJson(),
  };

  @override
  List<Object?> get props => [isDefault, pokemon];
}
