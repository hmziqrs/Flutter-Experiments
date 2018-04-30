import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:experimint/Servcies/Firebase/Auth.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.snapshot, this.animation});
  final DataSnapshot snapshot;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(
                  snapshot.value['avatar'],
                ),
              ),
            ),
            new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    snapshot.value['name'],
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    child: snapshot.value['imageUrl'] != null
                        ? new Image.network(
                            snapshot.value['image'],
                            width: 250.0,
                          )
                        : new Text(snapshot.value['text']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
