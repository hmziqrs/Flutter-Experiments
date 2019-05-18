import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MarcinHome(),
    ));

class MarcinHome extends StatefulWidget {
  @override
  MarcinHomeState createState() => MarcinHomeState();
}

class MarcinHomeState extends State<MarcinHome> {
  final list = [
    {'route': '/marcinListView', 'name': 'Marcin Home'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: list
                .map((obj) => new RaisedButton(
                      child: new Text(obj["name"]),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(obj["route"]),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
