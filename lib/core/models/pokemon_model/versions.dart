import 'package:equatable/equatable.dart';

import 'generation_iii.dart';
import 'generation_iv.dart';
import 'generation_v.dart';

class Versions extends Equatable {
  final GenerationIii? generationIii;
  final GenerationIv? generationIv;
  final GenerationV? generationV;

  const Versions({this.generationIii, this.generationIv, this.generationV});

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    generationIii:
        json['generation-iii'] == null
            ? null
            : GenerationIii.fromJson(
              json['generation-iii'] as Map<String, dynamic>,
            ),
    generationIv:
        json['generation-iv'] == null
            ? null
            : GenerationIv.fromJson(
              json['generation-iv'] as Map<String, dynamic>,
            ),
    generationV:
        json['generation-v'] == null
            ? null
            : GenerationV.fromJson(
              json['generation-v'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'generation-iii': generationIii?.toJson(),
    'generation-iv': generationIv?.toJson(),
    'generation-v': generationV?.toJson(),
  };

  @override
  List<Object?> get props {
    return [generationIii, generationIv, generationV];
  }
}
