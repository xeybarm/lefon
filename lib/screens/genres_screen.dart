import 'package:flutter/material.dart';
import 'package:lefon/models/audio_data.dart';
import 'package:lefon/widgets/audio_cover.dart';
import './home_screen.dart';
import '../models/genre_data.dart';

class GenresScreen extends StatefulWidget {
  static const routeName = '/genres-screen';
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final index = routeArgs['index'];

    return Scaffold(
        body: Column(
      children: [
        text('${genreData[index].genre.toString().split('.').last}', 30.0),
        Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: audioData.map((data) {
                  return data.genre == genreData[index].genre
                      ? Column(
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
                        )
                      : SizedBox();
                }).toList()
                  ..removeWhere((element) => element.runtimeType == SizedBox))),
      ],
    ));
  }
}
