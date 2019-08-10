import 'package:flutter/material.dart';
import '../components/list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: new Center(
        child: new List(),
      ),
    );
  }
}
