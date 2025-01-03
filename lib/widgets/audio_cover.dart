import 'package:flutter/material.dart';
import 'dart:ui';

class AudioCover extends StatelessWidget {
  final String title;
  final String author;
  final String cover;
  final String url;
  final double height;
  final double witdh;
  final bool isShadow;

  AudioCover(
      {this.title,
      this.author,
      this.cover,
      this.url,
      this.height,
      this.witdh,
      this.isShadow});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isShadow
            ? Transform.translate(
                offset: Offset(10, 10),
                child: Container(
                  width: witdh - 10,
                  height: height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          cover,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                color: Colors.transparent,
                              )),
                        )
                      ],
                    ),
                  ),
                ))
            : SizedBox(),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: witdh,
            height: height,
            child: Image.asset(
              cover,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
