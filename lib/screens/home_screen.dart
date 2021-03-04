import 'package:flutter/material.dart';
import 'package:lefon/provider/border_model.dart';
import 'package:lefon/provider/voice_model.dart';
import 'package:lefon/widgets/book_list.dart';
import 'package:lefon/widgets/categories.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../screens/player_screen.dart';
import '../models/audio_data.dart';
import '../provider/border_model.dart';
import '../screens/genres_screen.dart';
import '../widgets/border_widget.dart';

enum Genre { Drama, Action, SciFi, Horror, Comedy }

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget text(text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  Genre genre;
  DragStartDetails startSwipe;
  DragUpdateDetails updateSwipe;
  bool left;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => VoiceModel()),
          ChangeNotifierProvider(create: (_) => BorderModel()),
        ],
        child: Consumer<BorderModel>(
          builder: (context, border, child) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 30),
                    alignment: Alignment.topLeft,
                    child: border.counterName == 1
                        ? BorderWidget(child: text("A-Z"), isBordered: true)
                        : BorderWidget(child: text("A-Z"), isBordered: false),
                  ),
                  border.counterAz > -1
                      ? BookList(
                          height: MediaQuery.of(context).size.height * 0.14,
                          isShadow: true,
                          replaceIndex: border.counterAz,
                        )
                      : BookList(
                          height: MediaQuery.of(context).size.height * 0.14,
                          isShadow: true,
                          replaceIndex: null,
                        ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.topLeft,
                    child: border.counterName == 2
                        ? BorderWidget(
                            child: text("Featured"), isBordered: true)
                        : BorderWidget(
                            child: text("Featured"), isBordered: false),
                  ),
                  border.counterFeatured > -1
                      ? BookList(
                          height: MediaQuery.of(context).size.height * 0.23,
                          isShadow: false,
                          replaceIndex: border.counterFeatured,
                        )
                      : BookList(
                          height: MediaQuery.of(context).size.height * 0.23,
                          isShadow: false,
                          replaceIndex: null,
                        ),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.topLeft,
                      child: border.counterName == 3
                          ? BorderWidget(
                              child: text("Categories"), isBordered: true)
                          : BorderWidget(
                              child: text("Categories"), isBordered: false)),
                  border.counterCategory > -1
                      ? Categories(
                          replaceIndex: border.counterCategory,
                        )
                      : Categories(
                          replaceIndex: null,
                        ),
                ]),
            onVerticalDragUpdate: (swipe) {
              if (swipe.delta.dy < 0)
                left = true;
              else if (swipe.delta.dy > 0) left = false;
            },
            onVerticalDragEnd: (swipe) {
              if (left) {
                if (border.swipeNames)
                  border.decreaseCounter(Counters.Name);
                else if (border.swipeAz)
                  border.decreaseCounter(Counters.Az);
                else if (border.swipeFeatured)
                  border.decreaseCounter(Counters.Featured);
                else if (border.swipeCategory)
                  border.decreaseCounter(Counters.Category);
              } else {
                if (border.swipeNames)
                  border.increaseCounter(Counters.Name);
                else if (border.swipeAz)
                  border.increaseCounter(Counters.Az);
                else if (border.swipeFeatured)
                  border.increaseCounter(Counters.Featured);
                else if (border.swipeCategory)
                  border.increaseCounter(Counters.Category);
              }
            },
            onDoubleTap: () {
              print("double tap");
              if (border.counterAz > -1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return PlayerScreen(
                        title: audioData[border.counterAz].title,
                        author: audioData[border.counterAz].author,
                        cover: audioData[border.counterAz].cover,
                        url: audioData[border.counterAz].url,
                      );
                    },
                  ),
                );
              } else if (border.counterFeatured > -1) {
                Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return PlayerScreen(
                        title: audioData[border.counterFeatured].title,
                        author: audioData[border.counterFeatured].author,
                        cover: audioData[border.counterFeatured].cover,
                        url: audioData[border.counterFeatured].url,
                      );
                    }));
              } else if (border.counterCategory > -1) {
                Navigator.of(context).pushNamed(GenresScreen.routeName,
                    arguments: {'index': border.counterCategory});
              } else {
                switch (border.counterName) {
                  case 1:
                    border.setSwipes(Counters.Name, false);
                    border.setSwipes(Counters.Az, true);
                    border.setSwipes(Counters.Featured, false);
                    border.setSwipes(Counters.Category, false);
                    break;
                  case 2:
                    border.setSwipes(Counters.Name, false);
                    border.setSwipes(Counters.Featured, true);
                    border.setSwipes(Counters.Az, false);
                    border.setSwipes(Counters.Category, false);
                    break;
                  case 3:
                    border.setSwipes(Counters.Name, false);
                    border.setSwipes(Counters.Category, true);
                    border.setSwipes(Counters.Az, false);
                    border.setSwipes(Counters.Featured, false);
                    break;
                  default:
                    break;
                }
              }
            },
            onLongPress: () {
              print("long tap");
              border.resetCounter(Counters.Az);
              border.resetCounter(Counters.Name);
              border.resetCounter(Counters.Featured);
              border.resetCounter(Counters.Category);
              border.setSwipes(Counters.Name, true);
            },
          ),
        ),
      ),
    );
  }
}
