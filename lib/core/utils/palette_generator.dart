import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorUtil {
  static Future<int> getPalette(String imageUrl) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
          NetworkImage(imageUrl),
          maximumColorCount: 1,
        );

    final Color dominantColor =
        paletteGenerator.dominantColor?.color ?? Colors.grey;

    return dominantColor.toARGB32();
  }
}
