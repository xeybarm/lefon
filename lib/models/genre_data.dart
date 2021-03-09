import '../screens/home_screen.dart';

class GenreData {
  final int id;
  final Genre genre;
  final String voiceUrl;

  GenreData({this.id, this.genre, this.voiceUrl});
}

List<GenreData> genreData = [
  GenreData(
      id: 0,
      genre: Genre.World,
      voiceUrl: "sounds/menu_items/world_category.mp3"),
  GenreData(
      id: 1,
      genre: Genre.Azerbaijan,
      voiceUrl: "sounds/menu_items/azerbaijani_category.mp3"),
  GenreData(
      id: 2,
      genre: Genre.Children,
      voiceUrl: "sounds/menu_items/child_category.mp3")
];
