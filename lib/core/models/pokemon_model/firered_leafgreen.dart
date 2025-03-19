import 'package:equatable/equatable.dart';

class FireredLeafgreen extends Equatable {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  const FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireredLeafgreen.fromJson(Map<String, dynamic> json) {
    return FireredLeafgreen(
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'back_default': backDefault,
    'back_shiny': backShiny,
    'front_default': frontDefault,
    'front_shiny': frontShiny,
  };

  @override
  List<Object?> get props {
    return [backDefault, backShiny, frontDefault, frontShiny];
  }
}
