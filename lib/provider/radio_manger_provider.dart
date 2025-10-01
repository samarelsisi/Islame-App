import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? currentPlaying;
  bool isPlaying = false;
  double volume = 2.0;
  final AudioPlayer player = AudioPlayer();

  // play or pause
  Future<void> play(String url) async {
    if (currentPlaying == url) {
      if (isPlaying) {
        await player.pause();
        isPlaying = false;
      } else {
        await player.resume();
        isPlaying = true;
      }
    } else {
      await player.stop();
      currentPlaying = url;
      await player.play(UrlSource(url), volume: volume);
      isPlaying = true;
    }
    notifyListeners();
  }

  // stop
  Future<void> stop() async {
    await player.stop();
    currentPlaying = null;
    isPlaying = false;
    notifyListeners();
  }

  // set volume
  Future<void> setVolume(double audioVolume) async {
    volume = audioVolume.clamp(0.0, 1.0); // ensure in range
    await player.setVolume(volume);
    notifyListeners();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
