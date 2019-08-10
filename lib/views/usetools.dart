import 'package:flutter/material.dart';

class UseToolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new UseToolPageState();
}

class UseToolPageState extends State<UseToolPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常用工具'),
      ),
      body: new Center(
        child: new Text("常用工具"),
      ),
    );
  }
}
