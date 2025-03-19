import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/utils/app_router.dart';
import 'package:pokedex/core/utils/assets.dart';
import 'package:pokedex/features/Onboarding/presentation/manager/onboarding_audio_manager.dart';
import 'package:pokedex/features/Onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final OnboardingViewModel _viewModel;
  @override
  void initState() {
    _viewModel = OnboardingViewModel();
    _viewModel.playAudio(AssetsAudio.onboardingAudio);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => _viewModel.stopAudioAndNavigate(_navigateToHome),
          child: const OnboardingViewBody(),
        ),
      ),
    );
  }

  void _navigateToHome() {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  }
}
