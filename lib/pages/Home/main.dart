import 'package:flutter/material.dart';
import 'package:experimint/Widgets/GradientButton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Expermints'),
      ),
      body: new Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          new Flexible(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Text('buttre'),
                  onPressed: () => Navigator.of(context).pushNamed('/screen'),
                ),
                new GradientButton(
                  child: new Text('Friendly Chat'),
                  onPress: () =>
                      Navigator.of(context).pushNamed('/friendlyChat'),
                ),
                new GradientButton(
                  child: new Text('Shoes Concept'),
                  onPress: () =>
                      Navigator.of(context).pushNamed('/shoesConcept'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
