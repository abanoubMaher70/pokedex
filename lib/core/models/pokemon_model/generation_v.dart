import 'package:equatable/equatable.dart';

import 'black_white.dart';

class GenerationV extends Equatable {
  final BlackWhite? blackWhite;

  const GenerationV({this.blackWhite});

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
    blackWhite:
        json['black-white'] == null
            ? null
            : BlackWhite.fromJson(json['black-white'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'black-white': blackWhite?.toJson()};

  @override
  List<Object?> get props => [blackWhite];
}
