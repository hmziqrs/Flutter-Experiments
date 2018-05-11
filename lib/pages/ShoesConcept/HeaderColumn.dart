import 'package:flutter/material.dart';

import 'ShoeTheme.dart';

class HeaderColumn extends StatelessWidget {
  HeaderColumn({
    this.logoLink,
    this.headerHeading,
    this.headerDescription,
  });
  final String logoLink;
  final String headerHeading;
  final String headerDescription;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 40.0, left: 32.0),
          child: new Image(
            image: new AssetImage(this.logoLink),
            width: 140.0,
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(
            top: 24.0,
            left: 32.0,
          ),
          child: new Text(
            this.headerHeading,
            style: ShoeTheme.headerHeading(),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(
            top: 8.0,
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
    );
  }
}
