import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorUtil {
  static Future<String> getPalette(String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
            NetworkImage(imageUrl),
            maximumColorCount: 1,
          );

      // Get the dominant color
      final Color dominantColor =
          paletteGenerator.dominantColor?.color ?? Colors.grey;

      // Convert to HEX format
      return '#${dominantColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
    } catch (e) {
      return '#808080'; // Default Grey
    }
  }
}
