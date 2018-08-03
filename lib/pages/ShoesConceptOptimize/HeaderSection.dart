// import 'dart:math';
import 'package:flutter/material.dart';

// import 'package:pigment/pigment.dart';

import 'ShoeTheme.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
    this.headerHeight,
    this.parallax,
    this.gradientColors,
  });
  final String logoLink;
  final String headerHeading;
  final String headerDescription;
  final double headerHeight;
  final double parallax;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    // var parallaxLogic = 50 + (parallax * 200).toInt();
    // if (parallaxLogic < 0) {
    //   parallaxLogic = 50;
    // }
    // print(parallaxLogic);
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
            new FractionalTranslation(
              translation: new Offset(0.0 - parallax * 1.6, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                      maxLines: 4,
                      style: ShoeTheme.headerDescription(),
                    ),
                  ),
                ],
              ),
            ),
            // new Flexible(
            //   child: new Container(
            //     alignment: Alignment.bottomCenter,
            //     child: new FractionalTranslation(
            //       translation: new Offset(00.0, 0.0),
            //       child: new Text(
            //         "KaaaKa",
            //         textAlign: TextAlign.center,
            //         style: new TextStyle(
            //           fontSize: 120.0,
            //           fontWeight: FontWeight.bold,
            //           color: Pigment
            //               .fromString("#000000")
            //               .withAlpha(parallaxLogic),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
