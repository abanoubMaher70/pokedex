// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 1;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      isSoundEnabled: fields[0] as bool,
      allPokemonPixeled: fields[1] as bool,
      showDefaultPokemon: fields[2] as bool,
      isDefaultPokemonGif: fields[4] as bool,
      isScrollHorizontal: fields[6] as bool,
      favoritePokemonIds: (fields[5] as List?)?.cast<int>(),
      defaultPokemonId: fields[3] as int?,
      isDarkMode: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.isSoundEnabled)
      ..writeByte(1)
      ..write(obj.allPokemonPixeled)
      ..writeByte(2)
      ..write(obj.showDefaultPokemon)
      ..writeByte(3)
      ..write(obj.defaultPokemonId)
      ..writeByte(4)
      ..write(obj.isDefaultPokemonGif)
      ..writeByte(5)
      ..write(obj.favoritePokemonIds)
      ..writeByte(6)
      ..write(obj.isScrollHorizontal)
      ..writeByte(7)
      ..write(obj.isDarkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
