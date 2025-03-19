import 'package:equatable/equatable.dart';

class VersionDetail extends Equatable {
  final int? rarity;

  const VersionDetail({this.rarity});

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      VersionDetail(rarity: json['rarity'] as int?);

  Map<String, dynamic> toJson() => {'rarity': rarity};

  @override
  List<Object?> get props => [rarity];
}
