import 'package:flutter/material.dart';

import './Planet.dart';
import './DetailPage.dart';

class PlanetSummary extends StatelessWidget {
  PlanetSummary(this.planet, {this.horizontal = true});
  PlanetSummary.vertical(this.planet) : horizontal = false;

  final Planet planet;
  final bool horizontal;
  final double planetSize = 90.0;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => horizontal
          ? Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new PlanetDetail(planet),
                ),
              )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            this.card(),
            this.thumbnail(),
          ],
        ),
      ),
    );
  }

  Widget thumbnail() {
    return new Container(
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: new Hero(
        tag: "planet-${this.planet.id}",
        child: new Image(
          image: new AssetImage(this.planet.image),
          height: planetSize,
          width: planetSize,
        ),
      ),
    );
  }

  Widget planetValue({String value, String image, style}) {
    return new Container(
      child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(planet.gravity, style: style),
      ]),
    );
  }

  Widget card() {
    final headerTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );

    final regularTextStyle = const TextStyle(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400,
    );

    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

    return new Container(
      margin: new EdgeInsets.only(
        left: horizontal ? planetSize / 2 : 0.0,
        top: horizontal ? 0.0 : planetSize * 0.8,
      ),
      height: horizontal ? 150.0 : 170.0,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(8.0),
        color: new Color(0xFF333366),
        boxShadow: [
          new BoxShadow(
            blurRadius: 10.0,
            color: Colors.black38,
            offset: new Offset(0.0, 8.0),
          )
        ],
      ),
      child: new Container(
        constraints: new BoxConstraints.expand(),
        margin: new EdgeInsets.only(left: horizontal ? 76.0 : 0.0),
        child: new Column(
          crossAxisAlignment:
              horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(height: 4.0),
            new Text(
              this.planet.name,
              style: headerTextStyle,
            ),
            new Container(height: 10.0),
            new Text(
              planet.location,
              style: subHeaderTextStyle,
            ),
            new Container(
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: this.planetValue(
                    value: planet.distance,
                    image: 'assets/planets/ic_distance.png',
                    style: regularTextStyle,
                  ),
                ),
                new Container(
                  width: 32.0,
                ),
                new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: this.planetValue(
                    value: planet.gravity,
                    image: 'assets/img/ic_gravity.png',
                    style: regularTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
