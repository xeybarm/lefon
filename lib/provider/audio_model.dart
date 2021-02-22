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

  playAudio(String url) {
    isOn = true;
    notifyListeners();
    audio.play(url);
  }

  pauseAudio() {
    isOn = false;
    notifyListeners();
    audio.pause();
  }

  stopAudio() {
    isOn = false;
    notifyListeners();
    audio.stop();
  }

  seekAudio(Duration duration) {
    audio.seek(duration);
  }

  forward10Sec(Duration duration) {
    currentDuration = duration + Duration(seconds: 10);
    audio.seek(currentDuration);
  }

  reverse10Sec(Duration duration) {
    currentDuration = duration - Duration(seconds: 10);
    audio.seek(currentDuration);
  }
}
