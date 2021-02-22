import '../screens/home_screen.dart';

class AudioData {
  final int id;
  final String title;
  final String author;
  final String cover;
  final String url;
  final Genre genre;

  AudioData(
      {this.id, this.title, this.author, this.cover, this.url, this.genre});
}

List<AudioData> audioData = [
  AudioData(
      id: 0,
      title: "1st Title",
      author: "1st Author",
      cover: "assets/images/sample_cover.png",
      url:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Drama),
  AudioData(
      id: 1,
      title: "2nd Title",
      author: "2nd Author",
      cover: "assets/images/sample_cover.png",
      url:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Drama),
  AudioData(
      id: 2,
      title: "3rd Title",
      author: "3rd Author",
      cover: "assets/images/sample_cover.png",
      url:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.SciFi),
  AudioData(
      id: 3,
      title: "4th Title",
      author: "4th Author",
      cover: "assets/images/sample_cover.png",
      url:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Drama),
  AudioData(
      id: 4,
      title: "5th Title",
      author: "5th Author",
      cover: "assets/images/sample_cover.png",
      url:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Horror),
];
