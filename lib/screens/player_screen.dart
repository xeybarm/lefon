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
  bool left;
  bool down;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioModel(widget.url)),
        ChangeNotifierProvider(create: (_) => FavoriteModel()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<FavoriteModel>(
          builder: (context, fav, child) => Consumer<AudioModel>(
            builder: (context, audio, child) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  smallerTab(),
                  mainTab(audio, fav),
                ],
              ),
              onTap: () {
                if (audio.isOn) {
                  audio.pauseAudio();
                } else {
                  audio.playAudio(widget.url);
                }
              },
              onVerticalDragUpdate: (swipe) {
                if (swipe.delta.dy > 0)
                  down = true;
                else if (swipe.delta.dy < 0) down = false;
              },
              onVerticalDragEnd: (swipe) {
                if (down) closePlayer(context, audio);
              },
              onDoubleTap: () {
                fav.changeFavStatus();
              },
              onHorizontalDragUpdate: (swipe) {
                if (swipe.delta.dx < 0)
                  left = true;
                else if (swipe.delta.dx > 0) left = false;
              },
              onHorizontalDragEnd: (swipe) {
                if (left)
                  audio.reverse5Sec(audio.currentDuration);
                else
                  audio.forward5Sec(audio.currentDuration);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget mainTab(audio, fav) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.04,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    closePlayer(context, audio);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 60,
                    height: 8,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
                  child: AudioCover(
                    cover: widget.cover,
                    height: MediaQuery.of(context).size.height * 0.5,
                    witdh: MediaQuery.of(context).size.width * 0.9,
                    isShadow: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.author,
                    style: TextStyle(fontSize: 15, color: Colors.black38),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                WaveSlider(
                    max: audio.totalDuration.inSeconds.toDouble(),
                    value: audio.currentDuration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      audio.seekAudio(Duration(seconds: value.toInt()));
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        audio.currentDuration.toString().split('.').first,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        audio.totalDuration.toString().split('.').first,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (audio.currentDuration ==
                            Duration(hours: 0, minutes: 0, seconds: 0)) {
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
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (audio.currentDuration ==
                                Duration(hours: 0, minutes: 0, seconds: 0)) {
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
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(150)),
                                gradient: LinearGradient(colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).accentColor
                                ])),
                            child: Icon(
                              audio.isOn ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            if (audio.currentDuration ==
                                Duration(hours: 0, minutes: 0, seconds: 0)) {
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
                    GestureDetector(
                      onTap: () {
                        fav.changeFavStatus();
                      },
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: <Color>[
                              Theme.of(context).accentColor,
                              Theme.of(context).primaryColor
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
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget smallerTab() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.02,
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
    );
  }
}
