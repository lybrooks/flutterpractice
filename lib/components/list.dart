import 'package:flutter/material.dart';

import 'dart:io';

import 'dart:convert';
import '../views/details.dart';

class List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ListState();
  }
}

class ListState extends State<List> {
  var data;

  getData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';

    var httpClient = new HttpClient();
    var result;

    try {
      // ignore: close_sinks
      var request = await httpClient.getUrl(Uri.parse(url));

      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      } else {
        result = 'Error getting Json data: status ${response.statusCode}';
      }
    } catch (e) {
      result = 'Failed getting JSON data';
    }
    if (!mounted) {
      return;
    }
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new ListTile(
              subtitle: new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Expanded(
                          child: new Text(
//                          "Title",
                              data[index]["title"],
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        )
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("time:"),
                            new Text("2018-05-06")
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
//                          child: new Text("content"),
                          child: new Text("id:" + data[index]["id"].toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: new Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => _onTap(data[index]["id"].toString()),
            ),
          ),
        );
      },
    );
  }

  void _onTap(String id) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new Detail(id);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        }));
  }
}
