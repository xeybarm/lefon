import 'package:flutter/material.dart';
import 'package:lefon/screens/genres_screen.dart';
import 'package:lefon/screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Lefon());
}

class Lefon extends StatefulWidget {
  @override
  _LefonState createState() => _LefonState();
}

class _LefonState extends State<Lefon> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Lefon',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 251, 82, 48),
        accentColor: Color.fromARGB(255, 243, 197, 53),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        GenresScreen.routeName: (ctx) => GenresScreen()
      },
    );
  }
}
