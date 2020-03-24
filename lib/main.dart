import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash/Page/mainScreen.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(0, 0, 184, 148),
          accentColor: Color.fromARGB(1, 255, 118, 117),
          fontFamily: "Fira Code",
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Fira Code'),
          ),
        ),
        home: MainScreen()
    );
  }
}
