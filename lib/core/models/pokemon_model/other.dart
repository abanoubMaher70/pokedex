import 'package:equatable/equatable.dart';

import 'official_artwork.dart';
import 'showdown.dart';

class Other extends Equatable {
  final OfficialArtwork? officialArtwork;
  final Showdown? showdown;

  const Other({this.officialArtwork, this.showdown});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    officialArtwork:
        json['official-artwork'] == null
            ? null
            : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>,
            ),
    showdown:
        json['showdown'] == null
            ? null
            : Showdown.fromJson(json['showdown'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'official-artwork': officialArtwork?.toJson(),
    'showdown': showdown?.toJson(),
  };

  @override
  List<Object?> get props {
    return [officialArtwork, showdown];
  }
}
