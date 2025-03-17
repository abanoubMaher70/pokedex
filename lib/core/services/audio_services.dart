import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioService with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();

  AudioService() {
    WidgetsBinding.instance.addObserver(this);
    _player.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> playAudio(String assetsPath) async {
    await _player.play(AssetSource(assetsPath));
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  Future<void> resume() async {
    await _player.resume();
  }

  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await _player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      stopAudio(); // Stop audio when app goes to background
    } else if (state == AppLifecycleState.resumed) {
      resume();
    }
  }
}
