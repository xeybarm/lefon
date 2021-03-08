import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioModel with ChangeNotifier {
  bool isOn = true;
  AudioModel(String url) {
    initAudio(url);
  }

  AudioPlayer audio = AudioPlayer();

  Duration totalDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  Duration currentDuration = Duration(hours: 0, minutes: 0, seconds: 0);

  initAudio(String url) {
    audio.play(url);

    audio.onDurationChanged.listen((remainingDuration) {
      totalDuration = remainingDuration;
      notifyListeners();
    });

    audio.onAudioPositionChanged.listen((updatedPosition) {
      currentDuration = updatedPosition;
      notifyListeners();
    });
  }

  playAudio(String url) async {
    isOn = true;
    await audio.play(url);
    notifyListeners();
  }

  pauseAudio() async {
    isOn = false;
    await audio.pause();
    notifyListeners();
  }

  stopAudio() async {
    isOn = false;
    await audio.stop();
    notifyListeners();
  }

  seekAudio(Duration duration) {
    audio.seek(duration);
  }

  forward5Sec(Duration duration) {
    currentDuration = duration + Duration(seconds: 5);
    audio.seek(currentDuration);
  }

  reverse5Sec(Duration duration) {
    currentDuration = duration - Duration(seconds: 5);
    audio.seek(currentDuration);
  }
}
