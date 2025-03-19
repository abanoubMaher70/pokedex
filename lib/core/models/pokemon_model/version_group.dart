import 'package:equatable/equatable.dart';

class VersionGroup extends Equatable {
  final String? name;
  final String? url;

  const VersionGroup({this.name, this.url});

  factory VersionGroup.fromJson(Map<String, dynamic> json) =>
      VersionGroup(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
