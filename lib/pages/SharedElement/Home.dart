import 'package:flutter/material.dart';
import './TabBar.dart' as Tab;

class SharedElementHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double boxHeight = MediaQuery.of(context).size.height * 0.5;
    return new Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Hero(
                  tag: "app-bar",
                  child: new Container(
                    height: boxHeight,
                    color: Colors.blue,
                  ),
                ),
                new Hero(
                  tag: "content",
                  child: new Container(
                    height: 0.0,
                    color: Colors.red,
                  ),
                ),
                new Tab.TabBar(
                  canGo: true,
                  transition: false,
                  height: boxHeight,
                  isVisible: false,
                  forceBlock: false,
                  backPressedCallback: () => {},
                ),
              ],
            ),
            new GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed("/sharedElementTransition"),
              child: new Center(
                child: new Hero(
                  tag: "profile",
                  child: new Image(
                    height: 100.0,
                    width: 100.0,
                    image: new AssetImage("assets/planets/moon.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
