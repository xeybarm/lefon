import 'package:flutter/material.dart';
import 'package:lefon/provider/favorite_model.dart';
import 'package:lefon/screens/genres_screen.dart';
import 'package:lefon/widgets/audio_cover.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../models/audio_data.dart';
import '../models/genre_data.dart';

enum Genre { Drama, Action, SciFi, Horror, Comedy }

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget text(text, topPadding) {
  return Container(
    padding: EdgeInsets.only(top: topPadding, left: 30),
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  Genre genre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => FavoriteModel(),
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text("A-Z", 30.0),
            bookList(MediaQuery.of(context).size.height * 0.14, true),
            text("Featured", 0.0),
            bookList(MediaQuery.of(context).size.height * 0.23, false),
            // Consumer<FavoriteModel>(
            //   builder: (context, fav, child) {
            //     return fav.isFav ? text("Favorites", 10.0) : SizedBox();
            //   },
            // ),
            // Consumer<FavoriteModel>(
            //   builder: (context, fav, child) {
            //     return fav.isFav
            //         ? bookList(MediaQuery.of(context).size.height * 0.23, false)
            //         : SizedBox();
            //   },
            // ),
            text("Categories", 0.0),
            genres(),
          ],
        ),
        //  ),
      ),
    );
  }

  Widget bookList(height, isShadow) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height + MediaQuery.of(context).size.height * 0.1,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(5, (int index) {
            return Column(
              children: [
                AudioCover(
                  title: audioData[index].title,
                  author: audioData[index].author,
                  cover: audioData[index].cover,
                  url: audioData[index].url,
                  height: height,
                  witdh: MediaQuery.of(context).size.height * 0.17,
                  isShadow: isShadow,
                  isClickable: true,
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
          }),
        ),
      ),
    );
  }

  Widget genres() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(5, (int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(GenresScreen.routeName, arguments: {
                  'index': index,
                });
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).accentColor,
                          ])),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                          child: Text(
                              "${genreData[index].genre.toString().split('.').last}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ))))),
            );
          }),
        ),
      ),
    );
  }
}
