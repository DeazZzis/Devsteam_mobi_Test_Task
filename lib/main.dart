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
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))
        ),
        home: MainScreen());
  }
}
