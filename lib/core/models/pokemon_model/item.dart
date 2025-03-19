import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? name;
  final String? url;

  const Item({this.name, this.url});

  factory Item.fromJson(Map<String, dynamic> json) =>
      Item(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
