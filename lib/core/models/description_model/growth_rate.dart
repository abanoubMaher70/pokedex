import 'package:equatable/equatable.dart';

class GrowthRate extends Equatable {
  final String? name;
  final String? url;

  const GrowthRate({this.name, this.url});

  factory GrowthRate.fromJson(Map<String, dynamic> json) =>
      GrowthRate(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
