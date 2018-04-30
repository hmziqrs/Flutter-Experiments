import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Expermints'),
      ),
      body: new Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          new Flexible(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Text('buttre'),
                  onPressed: () => Navigator.of(context).pushNamed('/screen'),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: const Alignment(1.0, 0.5),
                      end: const Alignment(0.0, 0.0),
                      colors: <Color>[
                        Colors.red,
                        Colors.pink,
                      ],
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(4.0),
                    ),
                  ),
                  child: new Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(4.0),
                    ),
                    child: new InkWell(
                      splashColor: Colors.black,
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10.0,
                        ),
                        child: new Text('Friendly Chat'),
                      ),
                      onTap: () => null,
                      // Navigator.of(context).pushNamed('/friendlyChat'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
