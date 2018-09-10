import 'package:flutter/material.dart';
import './Wrapper.dart';
import './Planet.dart';
import './PlanetSummary.dart';

class PlanetDetail extends StatelessWidget {
  PlanetDetail(this.planet);

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return new Wrapper(
      new Container(
        color: new Color(0xFF736AB7),
        constraints: new BoxConstraints.expand(),
        child: new Stack(
          children: <Widget>[
            this.background(context),
            this.gradient(context),
            this.content(),
            this.toolbar(context),
            // new Hero(
            //   tag: "planet-${this.planet.id}",
            //   child: new Image.asset(planet.image, width: 96.0, height: 96.0),
            // ),
          ],
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.5;
    // final double height = 300.0;
    return new Container(
      child: new Image.network(
        this.planet.picture,
        height: height,
        fit: BoxFit.cover,
      ),
      constraints: new BoxConstraints.expand(height: height),
    );
  }

  Widget gradient(BuildContext context) {
    final double top = MediaQuery.of(context).size.height * 0.40;
    return new Container(
      margin: new EdgeInsets.only(top: top),
      height: 100.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        gradient: new LinearGradient(
          begin: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          colors: [
            new Color(0x00736AB7),
            new Color(0xFF736AB7),
          ],
        ),
      ),
    );
  }

  Widget content() {
    final headerTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
    final _overviewTitle = "Overview".toUpperCase();

    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(
          planet,
          horizontal: false,
        ),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                _overviewTitle,
                style: headerTextStyle,
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 18.0,
                  color: new Color(0xff00c6ff)),
              new Text(planet.description),
            ],
          ),
        ),
      ],
    );
  }

  Container toolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
