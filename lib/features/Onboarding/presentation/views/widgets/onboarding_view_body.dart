import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants/app_theme.dart';
import 'package:pokedex/core/constants/constant_colors.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/assets.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/blinking_text.dart';
import 'package:pokedex/features/Onboarding/presentation/manager/onboarding_audio_manager.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(AppTheme.kPrimaryOnboardingTheme);
    });

    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(AssetsImage.backgroundImage, fit: BoxFit.cover),
        ),

        // pokemon-logo_illus
        Positioned(
          left: 5,
          right: 5,
          top: -10,
          child: SvgPicture.asset(AssetsImage.pokemonLogoIllus, width: 500),
        ),

        // FireRedVersion-logo
        Positioned(
          left: 75,
          right: 75,
          top: 160,
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
          top: 310,
          child: BlinkingText(text: 'Press Start'),
        ),

        //team-pokemon-image
        Positioned(
          bottom: 40,
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
            color: ConstantColors.kPrimaryRed,
            child: Text(
              textAlign: TextAlign.center,
              'Ⓒ 2004 GAME FREAK inc,',
              style: TextStyles.textStyle16,
            ),
          ),
        ),
      ],
    );
  }
}
