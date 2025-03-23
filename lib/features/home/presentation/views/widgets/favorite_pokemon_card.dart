import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/core/models/pokemon_model/pokemon_model.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';

class FavoritePokemonCard extends StatelessWidget {
  const FavoritePokemonCard({super.key, required this.pokemonHive});

  final PokemonModelHive pokemonHive;

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon = pokemonHive.toApiModel();

    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(pokemonHive.palette!),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              child: Text(
                "ゼクロム",
                style: TextStyle(color: Colors.white.withValues(alpha: 0.50)),
              ),
            ),
          ),
          SizedBox.expand(
            child: Image.network(
              // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/799.gif',
              // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/50.gif',
              // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/650.png',
              pokemon.sprites!.other!.officialArtwork!.frontDefault!,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritePokemon extends StatefulWidget {
  const FavoritePokemon({super.key});

  @override
  State<FavoritePokemon> createState() => _FavoritePokemonState();
}

class _FavoritePokemonState extends State<FavoritePokemon> {
  Color dominantColor = const Color(0xff394F59); // Default color
  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      const NetworkImage(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/744.png',
      ),
    );

    if (paletteGenerator.dominantColor != null) {
      setState(() {
        dominantColor = paletteGenerator.dominantColor!.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: dominantColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              child: Text(
                "ゼクロム",
                style: TextStyle(color: Colors.white.withValues(alpha: 0.50)),
              ),
            ),
          ),
          SizedBox.expand(
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
        ],
      ),
    );
  }
}




/* 


class ImagePaletteWidget extends StatefulWidget {
  final String imageUrl;

  const ImagePaletteWidget({super.key, required this.imageUrl});

  @override
  ImagePaletteWidgetState createState() => ImagePaletteWidgetState();
}

class ImagePaletteWidgetState extends State<ImagePaletteWidget> {
  PaletteGenerator? _paletteGenerator;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
          NetworkImage(widget.imageUrl),
          size: const Size(200, 100),
          maximumColorCount: 5,
        );
    setState(() {
      _paletteGenerator = paletteGenerator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Palette Example')),
      body:
          _paletteGenerator == null
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
                itemCount: _paletteGenerator!.colors.toList().length,
                itemBuilder: (context, index) {
                  final Color color = _paletteGenerator!.colors.toList()[index];
                  return Container(
                    color: color,
                    child: Center(child: Text(color.toString())),
                  );
                },
              ),
    );
  }
}

*/