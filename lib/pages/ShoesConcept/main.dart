import 'package:flutter/material.dart';

class ShoesConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Content(
        gradientColors: [
          Colors.red,
          Colors.purple,
        ],
        assetLink: "assets/Asics_Logo_1.png",
      ),
    );
  }
}

class Content extends StatelessWidget {
  Content({this.gradientColors: const <Color>[], this.assetLink});
  final List<Color> gradientColors;
  final String assetLink;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Expanded(
          flex: 2,
          child: new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: new Alignment(-0.2, -1.2),
                colors: this.gradientColors,
              ),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(top: 48.0, left: 32.0),
                  child: new Image(
                    image: new AssetImage(assetLink),
                    width: 140.0,
                  ),
                ),
                new Container(
                  child: new Text("This is Shoe 1"),
                )
              ],
            ),
          ),
        ),
        new Text('sad'),
      ],
    );
  }
}
