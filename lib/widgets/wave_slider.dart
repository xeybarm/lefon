import 'package:flutter/material.dart';
//import 'dart:math';
//import 'package:flutter_xlider/flutter_xlider.dart';

class WaveSlider extends StatefulWidget {
  WaveSlider({Key key, this.max, this.value, this.onChanged}) : super(key: key);

  final double max;
  final double value;
  final Function onChanged;

  @override
  _WaveSliderState createState() => _WaveSliderState();
}

class _WaveSliderState extends State<WaveSlider> {
  // List<FlutterSliderHatchMarkLabel> effects = [];
  // List<Map<dynamic, dynamic>> mEffects = [];
  // double ellv = 0;
  // double euuv = 0;

  // void initState() {
  //   super.initState();

  //   var rng = new Random();
  //   for (double i = 0; i < 100; i++) {
  //     mEffects.add({"percent": i, "size": 5 + rng.nextInt(60 - 5).toDouble()});
  //   }
  //   effects = updateEffects(
  //       ellv * 100 / mEffects.length, euuv * 100 / mEffects.length);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
              ).createShader(bounds);
            },
            child: Slider(
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.black12,
              value: widget.value,
              min: 0.0,
              max: widget.max,
              onChanged: widget.onChanged,
            ),
          ),

          // FlutterSlider(
          //     min: 0.0,
          //     max: widget.max,
          //     values: [widget.value],
          //     handlerWidth: 6,
          //     handlerHeight: 40,
          //     touchSize: 20,
          //     handler: FlutterSliderHandler(
          //         decoration: BoxDecoration(),
          //         child: Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(3),
          //               color: Colors.white,
          //               border: Border.all(
          //                   color: Colors.black.withOpacity(0.65), width: 1)),
          //         )),
          //     hatchMark: FlutterSliderHatchMark(
          //       labels: effects,
          //       linesAlignment: FlutterSliderHatchMarkAlignment.right,
          //       density: 0.5,
          //     ),
          //     trackBar: FlutterSliderTrackBar(
          //         inactiveTrackBar: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         activeTrackBarHeight: 2,
          //         inactiveTrackBarHeight: 1,
          //         activeTrackBar: BoxDecoration(
          //           color: Colors.transparent,
          //         )),
          //     onDragging: (a, b, c) {
          //       widget.onChanged(b);
          //       ellv = b;
          //       euuv = c;

          //       effects = updateEffects(
          //           b * 100 / mEffects.length, c * 100 / mEffects.length);
          //     }),
        ],
      ),
    );
  }

  // List<FlutterSliderHatchMarkLabel> updateEffects(
  //     double leftPercent, double rightPercent) {
  //   List<FlutterSliderHatchMarkLabel> newLabels = [];
  //   for (Map<dynamic, dynamic> label in mEffects) {
  //     if (label['percent'] >= leftPercent && label['percent'] <= rightPercent) {
  //       newLabels.add(FlutterSliderHatchMarkLabel(
  //           percent: label['percent'],
  //           label: Container(
  //             height: label['size'],
  //             width: 2.5,
  //             color: Colors.red,
  //           )));
  //     } else {
  //       newLabels.add(FlutterSliderHatchMarkLabel(
  //           percent: label['percent'],
  //           label: Container(
  //             height: label['size'],
  //             width: 1,
  //             color: Colors.black26,
  //           )));
  //     }
  //   }
  //   return newLabels;
  // }
}
