import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconly/iconly.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/core/widgets/custom_app_bar.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const MasonryGridExample();
  }
}

class MasonryGridExample extends StatefulWidget {
  const MasonryGridExample({super.key});

  @override
  State<MasonryGridExample> createState() => _MasonryGridExampleState();
}

class _MasonryGridExampleState extends State<MasonryGridExample> {
  final List<int> heights = [100, 200, 150, 250, 180, 220, 130, 300];
  Color dominantColor = const Color(0xff394F59); // Default color

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'Favorites',
          leading: Icon(IconlyBold.heart, size: 30, color: Colors.red),
        ),
        Expanded(
          child: MasonryGridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
            ),
            itemCount: heights.length,
            itemBuilder: (context, index) {
              return Container(
                height: heights[index].toDouble(),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: dominantColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.network(
                  filterQuality: FilterQuality.none,
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${(index + 1)}.png',
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${Random().nextInt(151)}.png',
      ),
    );

    if (paletteGenerator.dominantColor != null) {
      setState(() {
        dominantColor = paletteGenerator.dominantColor!.color;
      });
    }
  }
}
