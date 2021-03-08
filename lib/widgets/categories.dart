import 'package:flutter/material.dart';
import 'package:lefon/widgets/border_widget.dart';
import 'package:lefon/widgets/categories_item.dart';

class Categories extends StatelessWidget {
  final int replaceIndex;
  Categories({this.replaceIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: MediaQuery.of(context).size.height * 0.1,
        child: replaceIndex == null
            ? ListView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (int index) {
                  return CategoriesItem(index: index);
                }),
              )
            : ListView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (int index) {
                  return BorderWidget(
                    child: CategoriesItem(index: index),
                    isBordered: false,
                  );
                })
                  ..replaceRange(0, replaceIndex + 1, [
                    BorderWidget(
                        child: CategoriesItem(
                          index: replaceIndex,
                        ),
                        isBordered: true)
                  ]),
              ));
  }
}
