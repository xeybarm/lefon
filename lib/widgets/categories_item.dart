import 'package:flutter/material.dart';
import '../screens/genres_screen.dart';
import 'package:lefon/screens/genres_screen.dart';
import '../models/genre_data.dart';

class CategoriesItem extends StatelessWidget {
  final int index;
  CategoriesItem({this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(GenresScreen.routeName, arguments: {'index': index});
      },
    );
  }
}
