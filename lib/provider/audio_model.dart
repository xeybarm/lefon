import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class AudioModel with ChangeNotifier {
  bool isOn = true;
  AudioModel(String url) {
    initAudio(url);
  }

  AudioPlayer audio = AudioPlayer();
  AudioCache audioCache = AudioCache();

  Duration totalDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  Duration currentDuration = Duration(hours: 0, minutes: 0, seconds: 0);

  initAudio(String url) async {
    audioCache.play("sounds/tutorial/forward_tutorial.mp3");
    Future.delayed(const Duration(seconds: 7), () async {
      audioCache.play("sounds/tutorial/pause_tutorial.mp3");
      Future.delayed(const Duration(seconds: 3), () async {
        audio = await audioCache.play(url);

        audio.onDurationChanged.listen((remainingDuration) {
          totalDuration = remainingDuration;
          notifyListeners();
        });

        audio.onAudioPositionChanged.listen((updatedPosition) {
          currentDuration = updatedPosition;
          notifyListeners();
        });
      });
    });
  }

  playAudio(String url) async {
    isOn = true;
    audio = await audioCache.play(url);
    notifyListeners();
  }

  pauseAudio() {
    isOn = false;
    audio.pause();
    notifyListeners();
  }

  resumeAudio() {
    isOn = true;
    audio.resume();
    notifyListeners();
  }

  stopAudio() {
    audio.stop();
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
