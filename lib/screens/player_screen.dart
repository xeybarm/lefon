import 'package:flutter/material.dart';
import 'package:lefon/provider/audio_model.dart';
import 'package:lefon/provider/favorite_model.dart';
import 'package:lefon/widgets/audio_cover.dart';
import 'package:lefon/widgets/wave_slider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class PlayerScreen extends StatefulWidget {
  final String title;
  final String author;
  final String cover;
  final String url;

  PlayerScreen({this.title, this.author, this.cover, this.url});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

closePlayer(context, audio) {
  if (audio.currentDuration == Duration(hours: 0, minutes: 0, seconds: 0)) {
    showToast(context);
  } else {
    audio.stopAudio();
    Navigator.pop(context);
  }
}

showToast(context) {
  Toast.show("Audio is still loading...", context,
      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioModel(widget.url)),
        ChangeNotifierProvider(create: (_) => FavoriteModel()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            new Positioned(
              top: 25,
              left: 15,
              right: 15,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(
                        5,
                        5,
                      ),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Consumer<AudioModel>(
                          builder: (context, audio, child) => GestureDetector(
                            onTap: () {
                              closePlayer(context, audio);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: 60,
                              height: 8,
                              child: Divider(
                                color: Colors.transparent,
                                thickness: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 25, right: 25),
                          child: AudioCover(
                            cover: widget.cover,
                            height: MediaQuery.of(context).size.height * 0.5,
                            witdh: MediaQuery.of(context).size.width * 0.9,
                            isShadow: true,
                            isClickable: false,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.author,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.023,
                                color: Colors.black38),
                          ),
                        )
                      ],
                    ),
                    Consumer<AudioModel>(
                      builder: (context, audio, child) => Column(
                        children: <Widget>[
                          WaveSlider(
                              max: audio.totalDuration.inSeconds.toDouble(),
                              value: audio.currentDuration.inSeconds.toDouble(),
                              onChanged: (double value) {
                                audio.seekAudio(
                                    Duration(seconds: value.toInt()));
                              }),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  audio.currentDuration
                                      .toString()
                                      .split('.')
                                      .first,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                Text(
                                  audio.totalDuration
                                      .toString()
                                      .split('.')
                                      .first,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Consumer<AudioModel>(builder: (context, audio, child) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (audio.currentDuration ==
                                    Duration(
                                        hours: 0, minutes: 0, seconds: 0)) {
                                  showToast(context);
                                } else {
                                  audio.stopAudio();
                                  Navigator.pop(context);
                                }
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.black26,
                                size: 40,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    if (audio.currentDuration ==
                                        Duration(
                                            hours: 0, minutes: 0, seconds: 0)) {
                                      showToast(context);
                                    } else {
                                      audio.reverse10Sec(audio.currentDuration);
                                    }
                                  },
                                  child: Icon(
                                    Icons.fast_rewind,
                                    color: Colors.black26,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    if (audio.isOn) {
                                      audio.pauseAudio();
                                    } else {
                                      audio.playAudio(widget.url);
                                    }
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(150)),
                                        gradient: LinearGradient(colors: [
                                          Theme.of(context).primaryColor,
                                          Theme.of(context).accentColor
                                        ])),
                                    child: Icon(
                                      audio.isOn
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    if (audio.currentDuration ==
                                        Duration(
                                            hours: 0, minutes: 0, seconds: 0)) {
                                      showToast(context);
                                    } else {
                                      audio.forward10Sec(audio.currentDuration);
                                    }
                                  },
                                  child: Icon(
                                    Icons.fast_forward,
                                    color: Colors.black26,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            Consumer<FavoriteModel>(
                                builder: (context, fav, child) =>
                                    GestureDetector(
                                        onTap: () {
                                          fav.changeFavStatus();
                                        },
                                        child: ShaderMask(
                                          shaderCallback: (Rect bounds) {
                                            return LinearGradient(
                                              colors: <Color>[
                                                Theme.of(context).accentColor,
                                                Theme.of(context).primaryColor,
                                              ],
                                            ).createShader(bounds);
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: fav.isFav
                                                ? Theme.of(context).accentColor
                                                : Colors.black26,
                                            size: 40,
                                          ),
                                        ))),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
