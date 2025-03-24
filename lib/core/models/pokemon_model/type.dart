import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/pokemon_model/item.dart';

class Type extends Equatable {
  final int? slot;
  final Item? type;

  const Type({this.slot, this.type});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json['slot'] as int?,
    type:
        json['type'] == null
            ? null
            : Item.fromJson(json['type'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'slot': slot, 'type': type?.toJson()};

  @override
  List<Object?> get props => [slot, type];
}
