import 'package:equatable/equatable.dart';

class Habitat extends Equatable {
  final String? name;
  final String? url;

  const Habitat({this.name, this.url});

  factory Habitat.fromJson(Map<String, dynamic> json) =>
      Habitat(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
