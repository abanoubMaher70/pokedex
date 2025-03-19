import 'package:equatable/equatable.dart';

import 'language.dart';

class Name extends Equatable {
  final Language? language;
  final String? name;

  const Name({this.language, this.name});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    language:
        json['language'] == null
            ? null
            : Language.fromJson(json['language'] as Map<String, dynamic>),
    name: json['name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'language': language?.toJson(),
    'name': name,
  };

  @override
  List<Object?> get props => [language, name];
}
