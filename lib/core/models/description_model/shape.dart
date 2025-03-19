import 'package:equatable/equatable.dart';

class Shape extends Equatable {
  final String? name;
  final String? url;

  const Shape({this.name, this.url});

  factory Shape.fromJson(Map<String, dynamic> json) =>
      Shape(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
