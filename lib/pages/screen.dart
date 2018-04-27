import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Screen'),
      ),
      body: new Container(
        child: new Center(
          child: new Row(
            children: <Widget>[
              new Text('Screen a'),
              new RaisedButton(
                child: new Text('button'),
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
