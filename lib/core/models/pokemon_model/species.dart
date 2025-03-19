import 'package:equatable/equatable.dart';

class Species extends Equatable {
  final String? name;
  final String? url;

  const Species({this.name, this.url});

  factory Species.fromJson(Map<String, dynamic> json) =>
      Species(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
