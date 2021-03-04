import 'package:flutter/material.dart';
import 'book_list_item.dart';
import './border_widget.dart';

class BookList extends StatelessWidget {
  final double height;

  final bool isShadow;

  final int replaceIndex;

  BookList({this.height, this.isShadow, this.replaceIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height + MediaQuery.of(context).size.height * 0.1,
      child: replaceIndex == null
          ? ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (int index) {
                return BookListItem(
                    index: index, height: height, isShadow: isShadow);
              }),
            )
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (int index) {
                return BorderWidget(
                    child: BookListItem(
                        index: index, height: height, isShadow: false),
                    isBordered: false);
              })
                ..replaceRange(replaceIndex, replaceIndex + 1, [
                  BorderWidget(
                      child: BookListItem(
                          index: replaceIndex, height: height, isShadow: false),
                      isBordered: true)
                ]),
            ),
    );
  }
}
