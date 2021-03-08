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
      title: "Günümüzün qəhramanı",
      author: "Mixayıl Lermantov",
      cover: "assets/images/gunumuzun_lermantov.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1iHXOyblLksXe_19sJ-PjrLbeMmGGOqwK",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.World),
  AudioData(
      id: 1,
      title: "Hippi",
      author: "Paulo Coelho",
      cover: "assets/images/hippi_koelho.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1_kymjcmJm1jp8uA-5RhsCcbT3ryTeXBD",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=1EXITeasohLd0Q2voyd9_EBpmANAvv5ZB",
      genre: Genre.World),
  AudioData(
      id: 2,
      title: "Master və marqarita",
      author: "Mikxayıl Bulgakov",
      cover: "assets/images/master_bulgakov.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=11uAQAA941SHHzccKEni7hDzgF1rW3Lc2",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.World),
  AudioData(
      id: 3,
      title: "Qoca və dəniz",
      author: "Ernest Heminquey",
      cover: "assets/images/goca_heminquey.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1ofaQd4o5q73yzV9FL-wEcwTVr39Sf9E3",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.World),
  AudioData(
      id: 4,
      title: "Üç yoldaş",
      author: "Erix Maria Remark",
      cover: "assets/images/uc_remark.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1B2daj1uDUVp1P4AbAeyiflpQcA-1tnf5",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=1F3cu2RblqOM8WBP0E4w96qgTvFOrvHB7",
      genre: Genre.World),
  AudioData(
      id: 5,
      title: "Yad qadına məktublar",
      author: "Andre Moura",
      cover: "assets/images/yad_morua.png",
      voiceUrl: "http://docs.google.com/uc?export=open&id=",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=1zZvVjAs7d4bLnq5r61tcdSM6_4TtkYu5",
      genre: Genre.World),
  AudioData(
      id: 6,
      title: "İblis",
      author: "Hüseyn Cavid",
      cover: "assets/images/iblis_javid.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1BvElddjVmg0bFn2yyWSQdYG_HC0MyQO5",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 7,
      title: "Ölülər",
      author: "Cəlil Məmmədquluzadə",
      cover: "assets/images/olular_mammadguluzada.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1Vy5lkmdExMVdlHkoQ3QXutSkpLFd8951",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 8,
      title: "Dilbər",
      author: "Cəfər Cabbarlı",
      cover: "assets/images/dilbar_jabbarli.png",
      voiceUrl: "http://docs.google.com/uc?export=open&id=",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=1ehrPAbt5X-Mukby7C9iAXHZR1xpF0Ad4",
      genre: Genre.Azerbaijan),
  AudioData(
      id: 9,
      title: "Məlikməmməd",
      author: "Xalq nağılı",
      cover: "assets/images/malikmammad.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1dOmGrgVSPl8unvZgdeBxKUe1TwaaAYDd",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Children),
  AudioData(
      id: 10,
      title: "Tülkü və dəvə",
      author: "Xalq nağılı",
      cover: "assets/images/tulku_va_dava.png",
      voiceUrl:
          "http://docs.google.com/uc?export=open&id=1uS9SbsA018Ux4bBOj0MrZprv3fd1T250",
      audioUrl:
          "http://docs.google.com/uc?export=open&id=11Ol2txIzSL-AhMVfoJ_qoVr80ijDd-uj",
      genre: Genre.Children),
];
