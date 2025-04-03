import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final bool isSoundEnabled;

  @HiveField(1)
  final bool allPokemonPixeled;

  @HiveField(2)
  final bool showDefaultPokemon;

  @HiveField(3)
  final int? defaultPokemonId;

  @HiveField(4)
  final bool isDefaultPokemonGif;

  @HiveField(5)
  final List<int>? favoritePokemonIds;

  @HiveField(6)
  final bool isScrollHorizontal;

  @HiveField(7)
  final bool isDarkMode;

  const UserHiveModel({
    this.isSoundEnabled = true,
    this.allPokemonPixeled = false,
    this.showDefaultPokemon = true,
    this.isDefaultPokemonGif = false,
    this.isScrollHorizontal = false,
    this.favoritePokemonIds,
    this.defaultPokemonId,
    this.isDarkMode = false,
  });

  @override
  List<Object?> get props => [
    isSoundEnabled,
    allPokemonPixeled,
    showDefaultPokemon,
    defaultPokemonId,
    isDefaultPokemonGif,
    favoritePokemonIds,
    isScrollHorizontal,
    isDarkMode,
  ];
}
