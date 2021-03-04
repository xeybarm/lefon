import 'package:flutter/material.dart';
import 'package:lefon/models/audio_data.dart';
import 'package:lefon/provider/border_model.dart';
import 'package:lefon/widgets/genre_item.dart';
import './home_screen.dart';
import '../screens/player_screen.dart';
import '../widgets/border_widget.dart';
import 'package:provider/provider.dart';
import '../provider/voice_model.dart';
import '../models/genre_data.dart';

class GenresScreen extends StatefulWidget {
  static const routeName = '/genres-screen';
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  int counterGenres = -1;
  List<int> emptyIndeces = [];
  bool left;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final index = routeArgs['index'];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VoiceModel()),
        ChangeNotifierProvider(create: (_) => BorderModel()),
      ],
      child: Scaffold(
        body: Consumer<BorderModel>(
          builder: (context, border, child) => Consumer<VoiceModel>(
            builder: (context, voice, child) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(children: <Widget>[
                  text('${genreData[index].genre.toString().split('.').last}'),
                  Expanded(
                    child: counterGenres == -1
                        ? GridView.count(
                            crossAxisCount: 2,
                            children: audioData.map((data) {
                              return data.genre == genreData[index].genre
                                  ? BorderWidget(
                                      child: GenreItem(data: data),
                                      isBordered: false,
                                    )
                                  : SizedBox();
                            }).toList()
                              ..removeWhere(
                                  (element) => element.runtimeType == SizedBox))
                        : GridView.count(
                            crossAxisCount: 2,
                            children: audioData.map((data) {
                              if (data.genre != genreData[index].genre) {
                                emptyIndeces.add(data.id);
                              }
                              return data.genre == genreData[index].genre
                                  ? BorderWidget(
                                      child: GenreItem(data: data),
                                      isBordered: false,
                                    )
                                  : SizedBox();
                            }).toList()
                              ..replaceRange(counterGenres, counterGenres + 1, [
                                BorderWidget(
                                    child: GenreItem(
                                        data: audioData[counterGenres]),
                                    isBordered: true)
                              ])
                              ..removeWhere(
                                  (element) => element.runtimeType == SizedBox),
                          ),
                  ),
                ]),
              ),
              onHorizontalDragUpdate: (swipe) {
                if (swipe.delta.dx < 0)
                  left = true;
                else if (swipe.delta.dx > 0) left = false;
              },
              onHorizontalDragEnd: (swipe) {
                if (left) {
                  setState(() {
                    counterGenres++;

                    if (emptyIndeces.contains(counterGenres)) counterGenres++;
                    if (counterGenres > 3) counterGenres = -1;
                  });
                } else {
                  setState(() {
                    counterGenres--;
                    if (counterGenres < 0) counterGenres = -1;
                  });
                }
              },
              onDoubleTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return PlayerScreen(
                          title: audioData[counterGenres].title,
                          author: audioData[counterGenres].author,
                          cover: audioData[counterGenres].cover,
                          url: audioData[counterGenres].url,
                        );
                      }),
                );
              },
              onLongPress: () {
                emptyIndeces = [];
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
          ),
        ),
      ),
    );
  }
}
