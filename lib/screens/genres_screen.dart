import 'package:flutter/material.dart';
import 'package:lefon/models/audio_data.dart';
import 'package:lefon/provider/border_model.dart';
import 'package:lefon/widgets/genre_item.dart';
import './home_screen.dart';
import '../widgets/border_widget.dart';
import 'package:provider/provider.dart';
import '../screens/player_screen.dart';
import '../models/genre_data.dart';

class GenresScreen extends StatefulWidget {
  static const routeName = '/genres-screen';
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  bool right;
  bool down;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final index = routeArgs['index'];

    int counter;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BorderModel()),
      ],
      child: Scaffold(
        body: Consumer<BorderModel>(
          builder: (context, border, child) {
            if (genreData[index].genre == Genre.World) {
              counter = border.counterGenresW;
            } else if (genreData[index].genre == Genre.Azerbaijan) {
              counter = border.counterGenresA;
            } else {
              counter = border.counterGenresC;
            }

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(children: <Widget>[
                  text('${genreData[index].genre.toString().split('.').last}'),
                  Expanded(
                    child: counter == -1
                        ? GridView.count(
                            physics: NeverScrollableScrollPhysics(),
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
                            physics: NeverScrollableScrollPhysics(),
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
                                  (element) => element.runtimeType == SizedBox)
                              ..replaceRange(
                                  genreData[index].genre == Genre.World
                                      ? border.counterGenresW
                                      : genreData[index].genre ==
                                              Genre.Azerbaijan
                                          ? border.counterGenresA
                                          : border.counterGenresC,
                                  genreData[index].genre == Genre.World
                                      ? border.counterGenresW + 1
                                      : genreData[index].genre ==
                                              Genre.Azerbaijan
                                          ? border.counterGenresA + 1
                                          : border.counterGenresC + 1,
                                  [
                                    BorderWidget(
                                        child: GenreItem(
                                            data: genreData[index].genre ==
                                                    Genre.World
                                                ? audioData[
                                                    border.counterGenresW]
                                                : genreData[index].genre ==
                                                        Genre.Azerbaijan
                                                    ? audioData[
                                                        border.counterGenresA +
                                                            6]
                                                    : audioData[
                                                        border.counterGenresC +
                                                            9]),
                                        isBordered: true)
                                  ])),
                  ),
                ]),
              ),
              onHorizontalDragUpdate: (swipe) {
                if (swipe.delta.dx > 0)
                  right = true;
                else if (swipe.delta.dx < 0) right = false;
              },
              onHorizontalDragEnd: (swipe) {
                if (right)
                  border.increaseGenreCounter(genreData[index].genre);
                else
                  border.decreaseGenreCounter(genreData[index].genre);
              },
              onVerticalDragUpdate: (swipe) {
                if (swipe.delta.dy < 0)
                  down = false;
                else
                  down = true;
              },
              onVerticalDragEnd: (swipe) {
                border.pauseVoice();
                if (down) {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
              onDoubleTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return genreData[index].genre == Genre.World
                            ? PlayerScreen(
                                title: audioData[border.counterGenresW].title,
                                author: audioData[border.counterGenresW].author,
                                cover: audioData[border.counterGenresW].cover,
                                url: audioData[border.counterGenresW].audioUrl,
                              )
                            : genreData[index].genre == Genre.Azerbaijan
                                ? PlayerScreen(
                                    title: audioData[border.counterGenresA + 6]
                                        .title,
                                    author: audioData[border.counterGenresA + 6]
                                        .author,
                                    cover: audioData[border.counterGenresA + 6]
                                        .cover,
                                    url: audioData[border.counterGenresA + 6]
                                        .audioUrl,
                                  )
                                : PlayerScreen(
                                    title: audioData[border.counterGenresC + 9]
                                        .title,
                                    author: audioData[border.counterGenresC + 9]
                                        .author,
                                    cover: audioData[border.counterGenresC + 9]
                                        .cover,
                                    url: audioData[border.counterGenresC + 9]
                                        .audioUrl,
                                  );
                      }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
