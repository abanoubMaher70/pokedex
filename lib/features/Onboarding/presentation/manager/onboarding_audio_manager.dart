import 'package:pokedex/core/services/audio/audio_services.dart';

class OnboardingViewModel {
  final AudioService _audioService = AudioService();

  Future<void> playAudio(String assetsPath) async {
    await _audioService.playAudio(assetsPath);
  }

  Future<void> stopAudio() async {
    await _audioService.stopAudio();
  }

  Future<void> dispose() async {
    await _audioService.dispose();
  }

  Future<void> stopAudioAndNavigate(Function() onNavigate) async {
    await stopAudio();
    await dispose();
    onNavigate();
  }
}
