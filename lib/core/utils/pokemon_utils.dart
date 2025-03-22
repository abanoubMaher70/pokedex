import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokemon_type_constant.dart';
import 'package:pokedex/core/models/pokemon_type.dart';

Color getPokemonForegroundColor(PokemonType pokemonType) =>
    pokemonType.foregroundColor;

PokemonType convertPokemonType(String pokemonType) {
  return PokemonType.values.firstWhere(
    (element) => element.name == pokemonType,
  );
}

Color convertStringToColor(String hexColor) {
  String hex = hexColor.replaceFirst('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex'; // Add alpha if missing (FF = fully opaque)
  }
  return Color(int.parse(hex, radix: 16));
}
