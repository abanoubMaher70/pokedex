import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42B5A5),
      body: SafeArea(
        child: Stack(
          children: [
            // Logo
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
              top: 160,
              child: Image.asset(
                'assets/images/FireRedVersion-logo.png',
                width: 75,
              ),
            ),
            // Prese Start-txt
            Positioned(
              left: 0,
              right: 0,
              top: 350,
              child: Text(
                textAlign: TextAlign.center,
                'PRESE START',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            // // Charizard Image
            // Positioned(
            //   bottom: 30,
            //   right: -20,
            //   child: SvgPicture.asset(
            //     'assets/images/charizard-pokemon.svg',
            //     width: 300,
            //   ),
            // ),
            Positioned(
              bottom: 10,
              right: -20,
              child: Image.asset(
                'assets/images/charizard-pokemon.gif',
                width: 400,
              ),
            ),

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
