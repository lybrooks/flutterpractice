import 'package:flutter/material.dart';

import './views/home.dart';
import './views/mine.dart';
import './views/usetools.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[new HomePage(), new UseToolPage(), new MinePage()],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "常用工具", icon: new Icon(Icons.home)),
            new Tab(text: "我", icon: new Icon(Icons.home))
          ],
        ),
      ),
    );
  }
}
