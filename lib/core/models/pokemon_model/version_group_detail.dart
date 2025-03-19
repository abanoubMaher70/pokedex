import 'package:equatable/equatable.dart';

import 'move_learn_method.dart';
import 'version_group.dart';

class VersionGroupDetail extends Equatable {
  final int? levelLearnedAt;
  final MoveLearnMethod? moveLearnMethod;
  final dynamic order;
  final VersionGroup? versionGroup;

  const VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.order,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      levelLearnedAt: json['level_learned_at'] as int?,
      moveLearnMethod:
          json['move_learn_method'] == null
              ? null
              : MoveLearnMethod.fromJson(
                json['move_learn_method'] as Map<String, dynamic>,
              ),
      order: json['order'] as dynamic,
      versionGroup:
          json['version_group'] == null
              ? null
              : VersionGroup.fromJson(
                json['version_group'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'level_learned_at': levelLearnedAt,
    'move_learn_method': moveLearnMethod?.toJson(),
    'order': order,
    'version_group': versionGroup?.toJson(),
  };

  @override
  List<Object?> get props {
    return [levelLearnedAt, moveLearnMethod, order, versionGroup];
  }
}
