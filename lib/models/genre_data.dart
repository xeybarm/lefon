import '../screens/home_screen.dart';

class GenreData {
  final int id;
  final Genre genre;

  GenreData(this.id, this.genre);
}

List<GenreData> genreData = [
  GenreData(0, Genre.Drama),
  GenreData(1, Genre.Action),
  GenreData(2, Genre.SciFi),
  GenreData(3, Genre.Horror),
  GenreData(4, Genre.Comedy),
];
