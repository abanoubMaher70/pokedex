// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 0;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      jsonData: fields[2] as String?,
      palette: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.jsonData)
      ..writeByte(3)
      ..write(obj.palette);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
