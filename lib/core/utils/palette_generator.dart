import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorUtil {
  /// Extracts the dominant color from an image URL
  static Future<String> getPalette(String imageUrl) async {
    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(imageProvider);

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
