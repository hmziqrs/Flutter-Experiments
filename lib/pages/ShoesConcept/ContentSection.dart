import 'package:flutter/material.dart';

import 'ShoeTheme.dart';

class ContentSection extends StatefulWidget {
  ContentSection({
    this.headerHeight,
    this.contentHeading,
    this.contentSubHeading,
    this.contentBadge,
    this.colors,
    this.currentColor,
    this.changeCurrentColor,
  });
  final double headerHeight;
  final String contentHeading;
  final String contentSubHeading;
  final String contentBadge;
  final List<Color> colors;
  final Color currentColor;
  final void Function(Color) changeCurrentColor;

  @override
  State<StatefulWidget> createState() => new ContentSectionState();
}

class ContentSectionState extends State<ContentSection> {
  static const List<int> _ratings = <int>[1, 2, 3, 4, 5];
  static const List<int> _sizes = <int>[7, 8, 9, 10, 11];

  int _currentRating = 0;
  int _currentSize = 0;

  _setRating(int rating) {
    if (rating != _currentRating) {
      this.setState(() {
        _currentRating = rating;
      });
    }
  }

  _setSize(int size) {
    if (size != _currentSize) {
      this.setState(() {
        _currentSize = size;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32.0,
        right: 24.0,
        left: 24.0,
      ),
      color: Colors.white,
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
                    this.widget.contentHeading,
                    style: ShoeTheme.contentHeading(),
                  ),
                  new Text(
                    this.widget.contentSubHeading,
                    style: ShoeTheme.contentSubHeading(),
                  ),
                ],
              ),
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  color: widget.currentColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                child: new Text(
                  this.widget.contentBadge,
                  style: ShoeTheme.contentBadge(),
                ),
              ),
            ],
          ),
          new Row(
            children: _ratings
                .map(
                  (v) => new Container(
                        height: 36.0,
                        width: 36.0,
                        // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: new Material(
                          type: MaterialType.circle,
                          key: new Key(v.toString()),
                          color: Colors.transparent,
                          child: new IconButton(
                            iconSize: 18.0,
                            color: v <= _currentRating
                                ? this.widget.currentColor
                                : Colors.grey,
                            icon: new Icon(
                              Icons.star,
                            ),
                            onPressed: () => this._setRating(v),
                            splashColor:
                                this.widget.currentColor.withOpacity(0.2),
                          ),
                        ),
                      ),
                )
                .toList(),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new Text(
                  "SIZE",
                  style: ShoeTheme.sizeHeading(),
                ),
              ),
              new Row(
                children: _sizes
                    .map(
                      (size) => new Container(
                            width: 30.0,
                            height: 30.0,
                            margin: const EdgeInsets.only(top: 4.0, right: 8.0),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(15.0),
                              color: size == this._currentSize
                                  ? Colors.grey[400].withOpacity(0.8)
                                  : Colors.transparent,
                            ),
                            child: new FlatButton(
                              padding: const EdgeInsets.all(0.0),
                              shape: new CircleBorder(),
                              child: new Text(
                                size.toString(),
                                style: new TextStyle(
                                  color: size == this._currentSize
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              onPressed: () => this._setSize(size),
                            ),
                          ),
                    )
                    .toList(),
              ),
            ],
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 18.0, bottom: 12.0),
                child: new Text(
                  "COLOUR",
                  style: ShoeTheme.colorHeading(),
                ),
              ),
              new Container(
                alignment: FractionalOffset.center,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: this
                      .widget
                      .colors
                      .map(
                        (color) => new Container(
                              width: 18.0,
                              height: 18.0,
                              margin: const EdgeInsets.only(right: 24.0),
                              decoration: new BoxDecoration(
                                color: color,
                                borderRadius: new BorderRadius.circular(9.0),
                              ),
                              transform: color == this.widget.currentColor
                                  ? (new Matrix4.identity()
                                    ..scale(1.2)
                                    ..translate(-1.8, -1.8))
                                  : null,
                              child: new InkWell(
                                onTap: () =>
                                    this.widget.changeCurrentColor(color),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(9.0),
                                    border: color == this.widget.currentColor
                                        ? new Border.all(
                                            color: color, width: 1.0)
                                        : null,
                                  ),
                                  transform: new Matrix4.identity()
                                    ..scale(1.6, 1.6)
                                    ..translate(-3.4, -3.4),
                                ),
                              ),
                            ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
