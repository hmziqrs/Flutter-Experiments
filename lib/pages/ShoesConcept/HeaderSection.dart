import 'package:flutter/material.dart';

import 'ShoeTheme.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
    this.headerHeight,
    this.gradientColors,
  });
  final String logoLink;
  final String headerHeading;
  final String headerDescription;
  final double headerHeight;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: this.headerHeight,
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
              margin: const EdgeInsets.only(top: 28.0, left: 32.0),
              child: new Image(
                image: new AssetImage(this.logoLink),
                width: 140.0,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 32.0,
              ),
              child: new Text(
                this.headerHeading,
                style: ShoeTheme.headerHeading(),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(
                top: 6.0,
                left: 32.0,
                right: 40.0,
              ),
              child: new Text(
                this.headerDescription,
                maxLines: 5,
                style: ShoeTheme.headerDescription(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
