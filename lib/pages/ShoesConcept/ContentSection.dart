import 'package:flutter/material.dart';

import 'ShoeTheme.dart';

class ContentSection extends StatelessWidget {
  ContentSection({
    this.headerHeight,
    this.contnetHeight,
    this.contentHeading,
    this.contentSubHeading,
    this.contentBadge,
    this.colors,
    this.currentColor,
  });
  final double headerHeight;
  final double contnetHeight;
  final String contentHeading;
  final String contentSubHeading;
  final String contentBadge;
  final List<Color> colors;
  final Color currentColor;

  static const List<int> _ratings = <int>[1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32.0,
        right: 24.0,
        left: 24.0,
      ),
      margin: new EdgeInsets.only(top: this.headerHeight),
      color: Colors.white,
      height: this.contnetHeight,
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    this.contentHeading,
                    style: ShoeTheme.contentHeading(),
                  ),
                  new Text(
                    this.contentSubHeading,
                    style: ShoeTheme.contentSubHeading(),
                  ),
                ],
              ),
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  color: this.currentColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                child: new Text(
                  this.contentBadge,
                  style: ShoeTheme.contentBadge(),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              _ratings.map(v => new Icon(Icons.star),),
            ],
          )
        ],
      ),
    );
  }
}
