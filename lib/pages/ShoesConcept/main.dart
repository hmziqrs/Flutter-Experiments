import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:experimint/Utils/ColorUtils.dart';

import 'HeaderSection.dart';
import 'ContentSection.dart';

class ShoesConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    const List<Color> colors = <Color>[
      Color(0xFFbfeb84),
      Color(0xFF82d4f1),
      Color(0xFF363158)
    ];
    print(colors);
    return new Scaffold(
      body: new Content(
        // colors: [
        //   Colors.red,
        //   Colors.purple,
        // ],
        logoLink: "assets/Asics_Logo_1.png",
        headerHeading: 'GEL KAYANO TRAINER',
        headerDescription:
            'This entry-level model features a full-length Gum Rubber Outsole for excellent traction on the court. Rearfoot GEL Cushioning System provides enhanced cushioning - while the combination synthetic leather and mesh upper provides breathability and comfort. A great value for the multi-court player.',
        contentHeading: "ASICS GEL KAYANO",
        contentSubHeading: "RUNNING COLLECTION",
        contentBadge: "NEW",
        colors: colors,
      ),
      // colors: ['#d4d9a0', '#59524a', '#68947f'],
      // colors: ['#6899c0', '#38499d', '#7b2e48'],
    );
  }
}

class Content extends StatefulWidget {
  Content({
    this.colors,
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
    this.contentHeading,
    this.contentSubHeading,
    this.contentBadge,
  });
  final List<Color> colors;
  final String logoLink;
  final String headerHeading;
  final String headerDescription;
  final String contentHeading;
  final String contentSubHeading;
  final String contentBadge;

  @override
  State<StatefulWidget> createState() => new ContentState(
        colors: colors,
        logoLink: logoLink,
        headerHeading: headerHeading,
        headerDescription: headerDescription,
        contentHeading: contentHeading,
        contentSubHeading: contentSubHeading,
        contentBadge: contentBadge,
      );
}

class ContentState extends State<Content> {
  ContentState({
    this.colors,
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
    this.contentHeading,
    this.contentSubHeading,
    this.contentBadge,
  }) : _currentColor = colors[0];
  final List<Color> colors;
  final String logoLink;
  final String headerHeading;
  final String headerDescription;
  final String contentHeading;
  final String contentSubHeading;
  final String contentBadge;
  Color _currentColor;

  @override
  initState() {
    super.initState();
    print(this.colors);
    print(_currentColor);
  }

  final double _contnetHeight = 280.0;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = MediaQuery.of(context).size.height - _contnetHeight;

    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new HeaderSection(
          headerDescription: this.headerDescription,
          headerHeading: this.headerHeading,
          logoLink: this.logoLink,
          headerHeight: _headerHeight,
          gradientColors: this.colors,
        ),
        new ContentSection(
          headerHeight: _headerHeight,
          contnetHeight: this._contnetHeight,
          contentHeading: this.contentHeading,
          contentSubHeading: this.contentSubHeading,
          contentBadge: this.contentBadge,
          colors: this.colors,
          currentColor: this._currentColor,
        ),
        new Positioned(
          top: 230.0,
          left: 50.0,
          right: 50.0,
          child: new Container(
            child: new Transform(
              alignment: Alignment.center,
              // transform: new Matrix4.rotationZ(0.0),
              transform: new Matrix4.rotationZ(0.38)..leftTranslate(16.0, 40.0),
              child: new Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: null,
                    height: 14.0,
                    decoration: new BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(16.0),
                      ),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 26.0,
                          offset: new Offset(0.0, 2.0),
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
