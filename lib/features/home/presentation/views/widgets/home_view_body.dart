import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/category_tag.dart';
import 'package:pokedex/core/constants.dart';
import 'package:pokedex/core/utils/text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(kPrimaryHomeTheme);
    });

    return Column(
      children: [
        const PokemonCard(
          backgroundColor: Colors.amber,
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
        ),
        const PokemonCard(
          backgroundColor: Colors.green,
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
        ),

        ///
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.brown,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Charmander",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "#006",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 170,
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.backgroundColor,
    required this.imageURL,
  });

  final String imageURL;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "#006",
                style: TextStyles.pixelFont20.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text("Charmander", style: TextStyles.pixelFont20),

              const CategoryTag(text: "Greas", color: Colors.green),
            ],
          ),
          Image.network(imageURL),
        ],
      ),
    );
  }
}
