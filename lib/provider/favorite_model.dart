import 'package:flutter/material.dart';

class FavoriteModel with ChangeNotifier {
  bool isFav = false;

  changeFavStatus() {
    if (isFav) {
      isFav = false;
    } else {
      isFav = true;
    }
    notifyListeners();
  }
}
