import 'package:flutter/material.dart';

enum Counters { Name, Az, Featured, Category }

class BorderModel with ChangeNotifier {
  int counterName = 0;
  int counterAz = -1;
  int counterFeatured = -1;
  int counterCategory = -1;

  bool swipeNames = true;
  bool swipeAz = false;
  bool swipeFeatured = false;
  bool swipeCategory = false;

  increaseCounter(Counters counter) {
    switch (counter) {
      case Counters.Name:
        counterName++;
        if (counterName > 3) counterName = 0;
        break;
      case Counters.Az:
        counterAz++;
        if (counterAz > 4) counterAz = -1;
        break;
      case Counters.Featured:
        counterFeatured++;
        if (counterFeatured > 4) counterFeatured = -1;
        break;
      case Counters.Category:
        counterCategory++;
        if (counterCategory > 4) counterCategory = -1;
        break;
    }
    notifyListeners();
  }

  decreaseCounter(Counters counter) {
    switch (counter) {
      case Counters.Name:
        counterName--;
        if (counterName < 0) counterName = 0;
        break;
      case Counters.Az:
        counterAz--;
        if (counterAz < 0) counterAz = -1;
        break;
      case Counters.Featured:
        counterFeatured--;
        if (counterFeatured < 0) counterFeatured = -1;
        break;
      case Counters.Category:
        counterCategory--;
        if (counterCategory < 0) counterCategory = -1;
        break;
    }
    notifyListeners();
  }

  resetCounter(Counters counter) {
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
    }
    notifyListeners();
  }
}
