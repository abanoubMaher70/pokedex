import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/assets_image.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/blinking_text.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(kPrimaryOnboardingTheme);
    });
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushReplacement(AppRouter.kHomeView),
      child: Stack(
        children: [
          //Black container
          const BlackContainer(),

          // pokemon-logo_illus
          Positioned(
            left: 10,
            right: 10,
            top: 0,
            child: SvgPicture.asset(AssetsImage.pokemonLogoIllus, width: 450),
          ),

          // FireRedVersion-logo
          Positioned(
            left: 75,
            right: 75,
            top: 140,
            child: Image.asset(
              AssetsImage.fireRedVersionLogo,
              filterQuality: FilterQuality.none,
              width: 75,
            ),
          ),

          //Prese Start-txt
          const Positioned(
            left: 0,
            right: 0,
            top: 285,
            child: BlinkingText(text: 'Press Start'),
          ),

          //Black container
          const BlackContainer(),

          //team-pokemon-image
          Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: Image.asset(
              AssetsImage.teamPokemonImage,
              filterQuality: FilterQuality.none,
              width: 400,
            ),
          ),

          //bottom text
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 25,
              color: kPrimaryRed,
              child: Text(
                textAlign: TextAlign.center,
                'Ⓒ 2004 GAME FREAK inc,',
                style: TextStyles.textStyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlackContainer extends StatelessWidget {
  const BlackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: Container(height: 100, color: Colors.black),
    );
  }
}
