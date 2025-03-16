import 'package:flutter/material.dart';
import 'package:pokedex/core/constants.dart';
import 'package:pokedex/features/Onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryGreen,
      body: const SafeArea(child: OnboardingViewBody()),
    );
  }
}
