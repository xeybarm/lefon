import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lefon/models/audio_data.dart';
import 'package:lefon/models/genre_data.dart';
import '../screens/home_screen.dart';

enum Counters { Name, Az, Featured, Category, Genres }

class BorderModel with ChangeNotifier {
  int counterName = 0;
  int counterAz = -1;
  int counterFeatured = -1;
  int counterCategory = -1;
  int counterGenresW = -1;
  int counterGenresA = -1;
  int counterGenresC = -1;

  bool swipeNames = true;
  bool swipeAz = false;
  bool swipeFeatured = false;
  bool swipeCategory = false;
  bool swipeGenres = false;

  AudioPlayer voice = AudioPlayer();
  AudioCache voiceCache = AudioCache();

  playVoice(String url) async {
    voice = await voiceCache.play(url);
    notifyListeners();
  }

  pauseVoice() {
    voice?.pause();
    notifyListeners();
  }

  increaseCounter(Counters counter) {
    pauseVoice();
    switch (counter) {
      case Counters.Name:
        counterName++;
        if (counterName > 3) counterName = 0;
        break;
      case Counters.Az:
        counterAz++;
        if (counterAz > 10) counterAz = -1;
        playVoice(audioData[counterAz].voiceUrl);
        break;
      case Counters.Featured:
        counterFeatured++;
        if (counterFeatured > 10) counterFeatured = -1;
        playVoice(audioData[counterFeatured].voiceUrl);
        break;
      case Counters.Category:
        counterCategory++;
        if (counterCategory > 2) counterCategory = -1;
        playVoice(genreData[counterCategory].voiceUrl);
        break;
      case Counters.Genres:
        break;
    }
    notifyListeners();
  }

  decreaseCounter(Counters counter) {
    pauseVoice();
    switch (counter) {
      case Counters.Name:
        counterName--;
        if (counterName < 0) counterName = 0;
        break;
      case Counters.Az:
        counterAz--;
        if (counterAz < 0) counterAz = -1;
        playVoice(audioData[counterAz].voiceUrl);
        break;
      case Counters.Featured:
        counterFeatured--;
        if (counterFeatured < 0) counterFeatured = -1;
        playVoice(audioData[counterFeatured].voiceUrl);
        break;
      case Counters.Category:
        counterCategory--;
        if (counterCategory < 0) counterCategory = -1;
        playVoice(genreData[counterCategory].voiceUrl);
        break;
      case Counters.Genres:
        break;
    }
    notifyListeners();
  }

  resetCounter(Counters counter) {
    pauseVoice();
    switch (counter) {
      case Counters.Name:
        counterName = 0;
        break;
      case Counters.Az:
        counterAz = -1;
        break;
      case Counters.Featured:
        counterFeatured = -1;
        break;
      case Counters.Category:
        counterCategory = -1;
        break;
      case Counters.Genres:
        break;
    }
    notifyListeners();
  }

  increaseGenreCounter(genre) {
    pauseVoice();
    switch (genre) {
      case Genre.World:
        counterGenresW++;
        if (counterGenresW > 5) counterGenresW = -1;
        playVoice(audioData[counterGenresW].voiceUrl);
        break;
      case Genre.Azerbaijan:
        counterGenresA++;
        if (counterGenresA > 2) counterGenresA = -1;
        playVoice(audioData[counterGenresA + 6].voiceUrl);
        break;
      case Genre.Children:
        counterGenresC++;
        if (counterGenresC > 1) counterGenresC = -1;
        playVoice(audioData[counterGenresC + 9].voiceUrl);
        break;
    }
    notifyListeners();
  }

  decreaseGenreCounter(Genre genre) {
    pauseVoice();
    switch (genre) {
      case Genre.World:
        counterGenresW--;
        if (counterGenresW < 0) counterGenresW = -1;
        playVoice(audioData[counterGenresW].voiceUrl);
        break;
      case Genre.Azerbaijan:
        counterGenresA--;
        if (counterGenresA < 0) counterGenresA = -1;
        playVoice(audioData[counterGenresA + 6].voiceUrl);
        break;
      case Genre.Children:
        counterGenresC--;
        if (counterGenresC < 0) counterGenresC = -1;
        playVoice(audioData[counterGenresC + 9].voiceUrl);
        break;
    }
    notifyListeners();
  }

  setSwipes(Counters counter, bool swipe) {
    switch (counter) {
      case Counters.Name:
        swipeNames = swipe;
        break;
      case Counters.Az:
        swipeAz = swipe;
        break;
      case Counters.Featured:
        swipeFeatured = swipe;
        break;
      case Counters.Category:
        swipeCategory = swipe;
        break;
      case Counters.Genres:
        break;
    }
    notifyListeners();
  }
}
