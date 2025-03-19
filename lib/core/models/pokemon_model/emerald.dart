import 'package:equatable/equatable.dart';

class Emerald extends Equatable {
  final String? frontDefault;
  final String? frontShiny;

  const Emerald({this.frontDefault, this.frontShiny});

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
    frontDefault: json['front_default'] as String?,
    frontShiny: json['front_shiny'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_shiny': frontShiny,
  };

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
