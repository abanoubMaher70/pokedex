import 'package:equatable/equatable.dart';

class Area extends Equatable {
  final String? name;
  final String? url;

  const Area({this.name, this.url});

  factory Area.fromJson(Map<String, dynamic> json) =>
      Area(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
