import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'pages/Home/main.dart';
import 'pages/screen.dart';
import 'pages/FriendlyChat/main.dart';
import 'pages/ShoesConcept/main.dart';
import 'pages/ShoesConceptOptimize/main.dart';
import 'pages/AnimationDemo/main.dart';
import 'pages/Planets/main.dart';
import 'pages/SharedElement/Home.dart';
import 'pages/SharedElement/Transition.dart';

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
    final RouteObserver<PageRoute> routeObserver =
        new RouteObserver<PageRoute>();

    return new MaterialApp(
      navigatorObservers: [routeObserver],
      home: new HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/screen': (BuildContext context) => new Screen(),
        '/friendlyChat': (BuildContext context) => new FriendlyChat(),
        '/shoesConcept': (BuildContext context) => new ShoesConcept(),
        '/shoesConceptOptimize': (BuildContext context) =>
            new ShoesConceptOptimize(),
        '/animationDemo': (BuildContext context) => new AnimationDemo(),
        '/planetsHome': (BuildContext context) => new PlanetHome(),
        '/sharedElementHome': (BuildContext context) => new SharedElementHome(),
        '/sharedElementTransition': (BuildContext context) =>
            new SharedElementTransition(routeObserver),
      },
      theme: theme,
    );
  }
}
