import 'package:flutter/material.dart';
import './audio_cover.dart';
import 'package:lefon/models/audio_data.dart';

class GenreItem extends StatelessWidget {
  final AudioData data;
  GenreItem({this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AudioCover(
          title: data.title,
          author: data.author,
          cover: data.cover,
          url: data.url,
          height: MediaQuery.of(context).size.height * 0.2,
          witdh: MediaQuery.of(context).size.width * 0.3,
          isShadow: false,
          isClickable: true,
        ),
        Text(
          data.title,
        ),
        Text(
          data.author,
          style: TextStyle(color: Colors.black38),
        ),
      ],
    );
  }
}
