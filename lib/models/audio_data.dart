import '../screens/home_screen.dart';

class AudioData {
  final int id;
  final String title;
  final String author;
  final String cover;
  final String voiceUrl;
  final String audioUrl;
  final Genre genre;

  AudioData(
      {this.id,
      this.title,
      this.author,
      this.cover,
      this.voiceUrl,
      this.audioUrl,
      this.genre});
}

List<AudioData> audioData = [
  AudioData(
      id: 0,
      title: "Hippi",
      author: "Paulo Coelho",
      cover: "assets/images/hippi_koelho.png",
      voiceUrl: "sounds/book_names/hippi_koelho_name.mp3",
      audioUrl: "sounds/audiobooks/hippi_koelho.mp3",
      genre: Genre.World),
  AudioData(
      id: 1,
      title: "Üç yoldaş",
      author: "Erix Maria Remark",
      cover: "assets/images/uc_remark.png",
      voiceUrl: "sounds/book_names/uc_remark_name.mp3",
      audioUrl: "sounds/audiobooks/uc_remark.mp3",
      genre: Genre.World),
  AudioData(
      id: 2,
      title: "Yad qadına məktublar",
      author: "Andre Moura",
      cover: "assets/images/yad_moura.png",
      voiceUrl: "sounds/menu_items/books.mp3",
      audioUrl: "sounds/audiobooks/yad_moura.mp3",
      genre: Genre.World),
  AudioData(
      id: 3,
      title: "Günümüzün qəhramanı",
      author: "Mixayıl Lermantov",
      cover: "assets/images/gunumuzun_lermantov.png",
      voiceUrl: "sounds/book_names/gunumuzun_lermantov_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.World),
  AudioData(
      id: 4,
      title: "Master və marqarita",
      author: "Mikxayıl Bulgakov",
      cover: "assets/images/master_bulgakov.png",
      voiceUrl: "sounds/book_names/master_bulgakov_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.World),
  AudioData(
      id: 5,
      title: "Qoca və dəniz",
      author: "Ernest Heminquey",
      cover: "assets/images/goca_heminquey.png",
      voiceUrl: "sounds/book_names/goca_heminquey_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.World),
  AudioData(
      id: 6,
      title: "Dilbər",
      author: "Cəfər Cabbarlı",
      cover: "assets/images/dilbar_jabbarli.png",
      voiceUrl: "sounds/menu_items/books.mp3",
      audioUrl: "sounds/audiobooks/dilbar_jabbarli.mp3",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 7,
      title: "İblis",
      author: "Hüseyn Cavid",
      cover: "assets/images/iblis_javid.png",
      voiceUrl: "sounds/book_names/iblis_javid_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 8,
      title: "Ölülər",
      author: "Cəlil Məmmədquluzadə",
      cover: "assets/images/olular_mammadguluzada.png",
      voiceUrl: "sounds/book_names/olular_mammadguluzada_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 9,
      title: "Məlikməmməd",
      author: "Xalq nağılı",
      cover: "assets/images/malikmammad.png",
      voiceUrl: "sounds/book_names/malikmammad_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.Children),
  AudioData(
      id: 10,
      title: "Tülkü və dəvə",
      author: "Xalq nağılı",
      cover: "assets/images/tulku_va_dava.png",
      voiceUrl: "sounds/book_names/tulku_va_dava_name.mp3",
      audioUrl: "sounds/menu_items/books.mp3",
      genre: Genre.Children),
];
