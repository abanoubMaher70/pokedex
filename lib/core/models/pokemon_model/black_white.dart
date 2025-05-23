import 'package:equatable/equatable.dart';

import 'animated.dart';

class BlackWhite extends Equatable {
  final Animated? animated;
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  const BlackWhite({
    this.animated,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory BlackWhite.fromJson(Map<String, dynamic> json) => BlackWhite(
    animated:
        json['animated'] == null
            ? null
            : Animated.fromJson(json['animated'] as Map<String, dynamic>),
    backDefault: json['back_default'] as String?,
    backFemale: json['back_female'] as String?,
    backShiny: json['back_shiny'] as String?,
    backShinyFemale: json['back_shiny_female'] as String?,
    frontDefault: json['front_default'] as String?,
    frontFemale: json['front_female'] as String?,
    frontShiny: json['front_shiny'] as String?,
    frontShinyFemale: json['front_shiny_female'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'animated': animated?.toJson(),
    'back_default': backDefault,
    'back_female': backFemale,
    'back_shiny': backShiny,
    'back_shiny_female': backShinyFemale,
    'front_default': frontDefault,
    'front_female': frontFemale,
    'front_shiny': frontShiny,
    'front_shiny_female': frontShinyFemale,
  };

  @override
  List<Object?> get props {
    return [
      animated,
      backDefault,
      backFemale,
      backShiny,
      backShinyFemale,
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale,
    ];
  }
}
