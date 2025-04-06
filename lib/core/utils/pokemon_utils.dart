import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokemon_type_constant.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_type.dart';

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
    hex = 'FF$hex';
  }
  return Color(int.parse(hex, radix: 16));
}

String cleanText(String text) {
  return text.replaceAll(RegExp(r'[\n\f]'), ' ');
}

double generateHeight(int index) {
  final List<double> predefinedHeights = [100, 150, 200, 250, 300];
  return predefinedHeights[index % predefinedHeights.length];
}
