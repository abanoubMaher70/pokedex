import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:pokedex/features/home/presentation/views/widgets/favorite_pokemon_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryHomeTheme);
    });

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomHomeAppBar(),
        Text("Your Pokemon"),
        SizedBox(height: 4),
        FavoritePokemonCard(),
      ],
    );
  }
}

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
