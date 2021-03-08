import 'package:flutter/material.dart';
import 'package:lefon/widgets/audio_cover.dart';
import 'dart:ui';
import 'package:lefon/models/audio_data.dart';

class BookListItem extends StatelessWidget {
  final int index;
  final double height;
  final bool isShadow;

  BookListItem({this.index, this.height, this.isShadow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AudioCover(
          title: audioData[index].title,
          author: audioData[index].author,
          cover: audioData[index].cover,
          url: audioData[index].audioUrl,
          height: height,
          witdh: MediaQuery.of(context).size.height * 0.17,
          isShadow: isShadow,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            audioData[index].title,
          ),
        ),
        Text(
          audioData[index].author,
          style: TextStyle(color: Colors.black38),
        ),
      ],
    );
  }
}
