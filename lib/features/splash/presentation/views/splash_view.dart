import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/features/splash/presentation/views/blinking_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xff8C0000),
          statusBarIconBrightness: Brightness.light,
        ),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xff42B5A5),
      body: SafeArea(
        child: Stack(
          children: [
            //Black container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(height: 100, color: Colors.black),
            ),

            // pokemon-logo_illus
            Positioned(
              left: 10,
              right: 10,
              top: 0,
              child: SvgPicture.asset(
                'assets/images/pokemon-logo_illus.svg',
                width: 450,
              ),
            ),

            // FireRedVersion-logo
            Positioned(
              left: 75,
              right: 75,
              top: 140,
              child: Image.asset(
                'assets/images/FireRedVersion-logo.png',
                width: 75,
              ),
            ),

            //Prese Start-txt
            Positioned(
              left: 0,
              right: 0,
              top: 285,
              child: BlinkingText(text: 'Press Start'),
            ),

            //Black container
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: Container(height: 100, color: Colors.black),
            ),

            //team-pokemon-image
            Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/onboardingImage.gif',
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
                color: Color(0xff8C0000),
                child: Text(
                  textAlign: TextAlign.center,
                  'Ⓒ 2004 GAME FREAK inc,',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
