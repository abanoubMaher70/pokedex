import 'package:flutter/material.dart';

class FavoritePokemonCard extends StatelessWidget {
  const FavoritePokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff394F59),
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
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/650.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:palette_generator/palette_generator.dart';

// class FavoritePokemonCard extends StatefulWidget {
//   const FavoritePokemonCard({super.key});

//   @override
//   State<FavoritePokemonCard> createState() => _FavoritePokemonCardState();
// }

// class _FavoritePokemonCardState extends State<FavoritePokemonCard> {
//   Color dominantColor = const Color(0xff394F59); // Default color
//   @override
//   void initState() {
//     super.initState();
//     _updatePalette();
//   }

//   Future<void> _updatePalette() async {
//     final PaletteGenerator
//     paletteGenerator = await PaletteGenerator.fromImageProvider(
//       const NetworkImage(
//         'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
//       ),
//     );

//     if (paletteGenerator.dominantColor != null) {
//       setState(() {
//         dominantColor = paletteGenerator.dominantColor!.color;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: dominantColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: FittedBox(
//               child: Text(
//                 "ゼクロム",
//                 style: TextStyle(color: Colors.white.withValues(alpha: 0.50)),
//               ),
//             ),
//           ),
//           SizedBox.expand(
//             child: Image.network(
//               'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
//               fit: BoxFit.cover,
//               filterQuality: FilterQuality.none,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
