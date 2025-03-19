import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String? name;
  final String? url;

  const Language({this.name, this.url});

  factory Language.fromJson(Map<String, dynamic> json) =>
      Language(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
