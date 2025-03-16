import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playAudio(String assetsPath) async {
    await _player.play(AssetSource(assetsPath));
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
