import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String? name;
  final String? url;

  const Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      Pokemon(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
