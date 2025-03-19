import 'package:equatable/equatable.dart';

class Ability extends Equatable {
  final Ability? ability;
  final bool? isHidden;
  final int? slot;

  const Ability({this.ability, this.isHidden, this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability:
        json['ability'] == null
            ? null
            : Ability.fromJson(json['ability'] as Map<String, dynamic>),
    isHidden: json['is_hidden'] as bool?,
    slot: json['slot'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'ability': ability?.toJson(),
    'is_hidden': isHidden,
    'slot': slot,
  };

  @override
  List<Object?> get props => [ability, isHidden, slot];
}
