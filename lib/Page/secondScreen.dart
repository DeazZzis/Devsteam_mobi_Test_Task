import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash/Model/Photo.dart';

class SecondScreen extends StatefulWidget {
  Photo photo;

  SecondScreen(this.photo);

  @override
  _SecondScreenState createState() => _SecondScreenState(photo);
}

class _SecondScreenState extends State<SecondScreen> {
  Photo photo;

  _SecondScreenState(this.photo);

  String _chooseDescription(String d, String altD) {
    if ((d == null) && (altD == null)) {
      return "Description not found";
    } else if (d != null) {
      return d;
    } else {
      return altD;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            'Unsplash',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                    elevation: 2.0,
                    child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 65, 85, 0.9)),
                        child: Row(
                          children: [
                            Text(photo.username,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .title
                                        .color)),
                            Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.favorite,
                                    color:
                                        Theme.of(context).textTheme.title.color,
                                    size: 18.0)),
                            Text(photo.likes.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .title
                                        .color))
                          ],
                        )))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                    elevation: 2.0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 65, 85, 0.9)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.network(
                                photo.small,
                                fit: BoxFit.contain,
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "${photo.createdAt.month}"
                                    "/${photo.createdAt.day}"
                                    "/${photo.createdAt.year}",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Theme.of(context)
                                            .textTheme
                                            .title
                                            .color),
                                  ))
                            ])))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                    elevation: 2.0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 65, 85, 0.9)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Text(
                          _chooseDescription(
                              photo.description, photo.altDescription),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).textTheme.title.color),
                        ))))
          ],
        )));
  }
}
