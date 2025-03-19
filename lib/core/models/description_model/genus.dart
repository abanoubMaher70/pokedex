import 'package:equatable/equatable.dart';

import 'language.dart';

class Genus extends Equatable {
  final String? genus;
  final Language? language;

  const Genus({this.genus, this.language});

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
    genus: json['genus'] as String?,
    language:
        json['language'] == null
            ? null
            : Language.fromJson(json['language'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'genus': genus,
    'language': language?.toJson(),
  };

  @override
  List<Object?> get props => [genus, language];
}
