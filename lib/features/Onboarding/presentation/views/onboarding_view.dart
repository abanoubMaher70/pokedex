import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/features/Onboarding/presentation/manager/onboarding_view_model.dart';
import 'package:pokedex/features/Onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewModel onboardingViewModel = OnboardingViewModel();
  @override
  void initState() {
    onboardingViewModel.startAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryGreen,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => onboardingViewModel.stopAudioAndNavigate(navigation),
          child: const OnboardingViewBody(),
        ),
      ),
    );
  }

  void navigation() {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  }
}
