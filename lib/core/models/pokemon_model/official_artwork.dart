import 'package:equatable/equatable.dart';

class OfficialArtwork extends Equatable {
  final String? frontDefault;
  final String? frontShiny;

  const OfficialArtwork({this.frontDefault, this.frontShiny});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_shiny': frontShiny,
  };

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
