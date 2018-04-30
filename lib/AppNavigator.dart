import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'pages/home.dart';
import 'pages/screen.dart';
import 'pages/FriendlyChat/main.dart';

class AppNavigator extends StatelessWidget {
  final ThemeData theme = defaultTargetPlatform == TargetPlatform.iOS
      ? new ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.grey[100],
          primaryColorBrightness: Brightness.light,
        )
      : new ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orangeAccent[400],
        );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/screen': (BuildContext context) => new Screen(),
        '/friendlyChat': (BuildContext context) => new FriendlyChat(),
      },
      theme: theme,
    );
  }
}