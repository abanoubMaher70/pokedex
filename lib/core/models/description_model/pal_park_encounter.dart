import 'package:equatable/equatable.dart';

import 'area.dart';

class PalParkEncounter extends Equatable {
  final Area? area;
  final int? baseScore;
  final int? rate;

  const PalParkEncounter({this.area, this.baseScore, this.rate});

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) {
    return PalParkEncounter(
      area:
          json['area'] == null
              ? null
              : Area.fromJson(json['area'] as Map<String, dynamic>),
      baseScore: json['base_score'] as int?,
      rate: json['rate'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'area': area?.toJson(),
    'base_score': baseScore,
    'rate': rate,
  };

  @override
  List<Object?> get props => [area, baseScore, rate];
}
