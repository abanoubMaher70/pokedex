import 'package:equatable/equatable.dart';

class MoveLearnMethod extends Equatable {
  final String? name;
  final String? url;

  const MoveLearnMethod({this.name, this.url});

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return MoveLearnMethod(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
