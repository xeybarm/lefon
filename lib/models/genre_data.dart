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
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=17ymp_mHFZVP49UtxtZrJB9hAIb0ZEIFE"),
  GenreData(
      id: 1,
      genre: Genre.Azerbaijan,
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1kViU7iOCJlPUNqTbykxZftPG9-dLn5-l"),
  GenreData(
      id: 2,
      genre: Genre.Children,
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1U2rtRHdB3xRYNC7rHp9iB88Q9JFuhJmi")
];
