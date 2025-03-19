import 'package:equatable/equatable.dart';

class Stat extends Equatable {
  final int? baseStat;
  final int? effort;
  final Stat? stat;

  const Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json['base_stat'] as int?,
    effort: json['effort'] as int?,
    stat:
        json['stat'] == null
            ? null
            : Stat.fromJson(json['stat'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'base_stat': baseStat,
    'effort': effort,
    'stat': stat?.toJson(),
  };

  @override
  List<Object?> get props => [baseStat, effort, stat];
}
