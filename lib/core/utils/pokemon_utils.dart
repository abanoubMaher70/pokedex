import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/pokemon_type_colors.dart';
import 'package:pokedex/core/models/pokemon_type.dart';

Color getPokemonTypeColor(String type) =>
    pokemonColors[PokemonType.values.byName(type)]!;
