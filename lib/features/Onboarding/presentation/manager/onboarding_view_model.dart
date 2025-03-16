import 'package:flutter/material.dart';
import 'package:pokedex/core/services/audio_services.dart';
import 'package:pokedex/core/utils/assets.dart';

class OnboardingViewModel {
  final AudioService _audioService = AudioService();

  Future<void> startAudio() async {
    await _audioService.playAudio(AssetsAudio.onboardingAudio);
  }

  Future<void> stop() async {
    await _audioService.stopAudio();
  }

  Future<void> dispose() async {
    await _audioService.dispose();
  }

  Future<void> stopAudioAndNavigate(Function onNavigate) async {
    await _audioService.stopAudio();
    await _audioService.dispose();
    onNavigate();
  }
}
