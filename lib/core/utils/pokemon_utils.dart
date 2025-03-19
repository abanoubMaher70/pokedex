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
