import 'package:equatable/equatable.dart';

import 'language.dart';
import 'version.dart';

class FlavorTextEntry extends Equatable {
  final String? flavorText;
  final Language? language;
  final Version? version;

  const FlavorTextEntry({this.flavorText, this.language, this.version});

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntry(
      flavorText: json['flavor_text'] as String?,
      language:
          json['language'] == null
              ? null
              : Language.fromJson(json['language'] as Map<String, dynamic>),
      version:
          json['version'] == null
              ? null
              : Version.fromJson(json['version'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'flavor_text': flavorText,
    'language': language?.toJson(),
    'version': version?.toJson(),
  };

  @override
  List<Object?> get props => [flavorText, language, version];
}
