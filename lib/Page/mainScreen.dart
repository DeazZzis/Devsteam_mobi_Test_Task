import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unsplash/Model/Photo.dart';

class API {
  static Future getPhotos() {
    var url =
        'http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
    return http.get(url);
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoad = false;
  var _photos = List<Photo>();

  _getPhotos() {
    API.getPhotos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _photos = list.map((model) => Photo.fromJson(model)).toList();
        _isLoad = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            title: Text(
          'Unsplash',
          textAlign: TextAlign.center,
        )),
        body: _buildList());
  }

  String _chooseDescription(String d, String altD) {
    if ((d == null) && (altD == null)) {
      return "Description not found";
    } else if (d != null) {
      return d;
    } else {
      return altD;
    }
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: _photos.length,
        itemBuilder: (context, i) {
          return Container(
              height: 125.0,
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                    child: Row(children: [
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Image.network(
                            _photos[i].small,
                            fit: BoxFit.contain,
                            height: 110,
                            width: MediaQuery.of(context).size.width * 0.3,
                          )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    _chooseDescription(_photos[i].description,
                                        _photos[i].altDescription),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .title
                                            .color),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text("\@" + _photos[i].username,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Theme.of(context)
                                              .textTheme
                                              .title
                                              .color)))
                            ]),
                      )
                    ])),
              ));
        });
  }
}
