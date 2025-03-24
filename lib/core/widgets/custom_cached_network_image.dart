import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.pokemonImage,
    this.height,
  });

  final String pokemonImage;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pokemonImage,
      fit: BoxFit.cover,
      height: height,
      filterQuality: FilterQuality.none,
      errorWidget:
          (context, url, error) => const Icon(Icons.error, color: Colors.red),
    );
  }
}
