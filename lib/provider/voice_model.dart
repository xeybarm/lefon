import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class VoiceModel with ChangeNotifier {
  AudioPlayer voice = AudioPlayer();

  playVoice(String url) {
    voice.play(url);
    notifyListeners();
  }

  stopVoice() {
    voice.stop();
    notifyListeners();
  }
}
