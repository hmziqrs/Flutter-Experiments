import 'package:flutter/material.dart';

import 'HeaderColumn.dart';

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
          logoLink: "assets/Asics_Logo_1.png",
          headerHeading: 'GEL KAYANO TRAINER',
          headerDescription:
              'This entry-level model features a full-length Gum Rubber Outsole for excellent traction on the court. Rearfoot GEL Cushioning System provides enhanced cushioning - while the combination synthetic leather and mesh upper provides breathability and comfort. A great value for the multi-court player.',
          contentHeading: "ASICS GEL KAYANO"),
    );
  }
}

class Content extends StatelessWidget {
  Content({
    this.gradientColors: const <Color>[],
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
    this.contentHeading,
  });
  final List<Color> gradientColors;
  final String logoLink;
  final String headerHeading;
  final String headerDescription;
  final String contentHeading;

  final double _contnetHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = MediaQuery.of(context).size.height - _contnetHeight;
    // TODO: implement build
    HeaderColumn column = new HeaderColumn(
      headerDescription: this.headerDescription,
      headerHeading: this.headerHeading,
      logoLink: this.logoLink,
    );
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          height: _headerHeight,
          child: new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: new Alignment(-0.2, -1.2),
                colors: this.gradientColors,
              ),
            ),
            child: column,
          ),
        ),
        new Container(
          margin: new EdgeInsets.only(top: _headerHeight),
          color: Colors.red.withOpacity(1.0),
          height: _contnetHeight,
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Text(this.contentHeading),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        new Positioned(
          top: 250.0,
          left: 36.0,
          right: 36.0,
          child: new Container(
            child: new Transform(
              alignment: Alignment.center,
              // transform: new Matrix4.rotationZ(0.0),
              transform: new Matrix4.rotationZ(0.39)..leftTranslate(16.0, 40.0),
              child: new Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: null,
                    height: 16.0,
                    decoration: new BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(16.0),
                      ),
                      // color: Colors.transparent,
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 32.0,
                          offset: new Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                  ),
                  new Image(
                    image: new AssetImage('assets/shoes/yellow.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
