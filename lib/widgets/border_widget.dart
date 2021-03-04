import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  final Widget child;
  final bool isBordered;

  BorderWidget({this.child, this.isBordered});

  @override
  Widget build(BuildContext context) {
    return isBordered
        ? InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 5.0, color: Colors.red),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: child,
              ),
            ),
          )
        : child;
  }
}
