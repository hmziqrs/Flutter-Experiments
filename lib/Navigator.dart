import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/screen.dart';

class Navigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/screen': (BuildContext context) => new Screen(),
      },
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
