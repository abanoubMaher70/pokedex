import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_type.dart';
import 'package:pokedex/core/widgets/pokemon_type_icon.dart';

extension PokemonTypeConstant on PokemonType {
  Color get backgroundColor {
    switch (this) {
      case PokemonType.fire:
        return const Color(0xFFFAD7BE);
      case PokemonType.water:
        return const Color(0xFFF3F6FD);
      case PokemonType.grass:
        return const Color(0xFFD1ECC4);
      case PokemonType.electric:
        return const Color(0xFFFDF1C3);
      case PokemonType.psychic:
        return const Color(0xFFFEEAF0);
      case PokemonType.ice:
        return const Color(0xFFFFFFFF);
      case PokemonType.dragon:
        return const Color(0xFFDACBFD);
      case PokemonType.dark:
        return const Color(0xFFBBA495);
      case PokemonType.fairy:
        return const Color(0xFFFFFFFF);
      case PokemonType.steel:
        return const Color(0xFFFFFEFE);
      case PokemonType.rock:
        return const Color(0xFFE3D7A5);
      case PokemonType.ground:
        return const Color(0xFFFAF4E6);
      case PokemonType.bug:
        return const Color(0xFFDFEA86);
      case PokemonType.ghost:
        return const Color(0xFFC0B4D4);
      case PokemonType.poison:
        return const Color(0xFFD9A0D9);
      case PokemonType.normal:
        return const Color(0xFFE3E3D5);
      case PokemonType.fighting:
        return const Color(0xFFE99B97);
      case PokemonType.flying:
        return const Color(0xFFFFFFFF);
    }
  }

  Color get foregroundColor {
    switch (this) {
      case PokemonType.fire:
        return const Color(0xFFF08030);
      case PokemonType.water:
        return const Color(0xFF6890F0);
      case PokemonType.grass:
        return const Color(0xFF78C850);
      case PokemonType.electric:
        return const Color(0xFFF8D030);
      case PokemonType.psychic:
        return const Color(0xFFF85888);
      case PokemonType.ice:
        return const Color(0xFF98D8D8);
      case PokemonType.dragon:
        return const Color(0xFF7038F8);
      case PokemonType.dark:
        return const Color(0xFF705848);
      case PokemonType.fairy:
        return const Color(0xFFEE99AC);
      case PokemonType.steel:
        return const Color(0xFFB8B8D0);
      case PokemonType.rock:
        return const Color(0xFFB8A038);
      case PokemonType.ground:
        return const Color(0xFFE0C068);
      case PokemonType.bug:
        return const Color(0xFFA8B820);
      case PokemonType.ghost:
        return const Color(0xFF705898);
      case PokemonType.poison:
        return const Color(0xFFA040A0);
      case PokemonType.normal:
        return const Color(0xFFA8A878);
      case PokemonType.fighting:
        return const Color(0xFFC03028);
      case PokemonType.flying:
        return const Color(0xFFA890F0);
    }
  }

  String get typeIcon {
    switch (this) {
      case PokemonType.fire:
        return 'assets/images/pokemons_types/fire.png';
      case PokemonType.water:
        return 'assets/images/pokemons_types/water.png';
      case PokemonType.grass:
        return 'assets/images/pokemons_types/grass.png';
      case PokemonType.electric:
        return 'assets/images/pokemons_types/electric.png';
      case PokemonType.psychic:
        return 'assets/images/pokemons_types/psychic.png';
      case PokemonType.ice:
        return 'assets/images/pokemons_types/ice.png';
      case PokemonType.dragon:
        return 'assets/images/pokemons_types/dragon.png';
      case PokemonType.dark:
        return 'assets/images/pokemons_types/dark.png';
      case PokemonType.fairy:
        return 'assets/images/pokemons_types/fairy.png';
      case PokemonType.steel:
        return 'assets/images/pokemons_types/steel.png';
      case PokemonType.rock:
        return 'assets/images/pokemons_types/rock.png';
      case PokemonType.ground:
        return 'assets/images/pokemons_types/ground.png';
      case PokemonType.bug:
        return 'assets/images/pokemons_types/bug.png';
      case PokemonType.ghost:
        return 'assets/images/pokemons_types/ghost.png';
      case PokemonType.poison:
        return 'assets/images/pokemons_types/poison.png';
      case PokemonType.normal:
        return 'assets/images/pokemons_types/normal.png';
      case PokemonType.fighting:
        return 'assets/images/pokemons_types/fighting.png';
      case PokemonType.flying:
        return 'assets/images/pokemons_types/flying.png';
    }
  }
}
