import 'dart:async';
import 'dart:math'; // new
import 'dart:io';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart'; // new
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:experimint/Servcies/Firebase/Auth.dart';
import 'package:experimint/Servcies/Firebase/Analytics.dart';
import 'package:experimint/Servcies/Firebase/Database.dart';
import 'package:experimint/Servcies/Firebase/Storage.dart';

import 'package:experimint/MyTheme.dart';
import 'package:experimint/Widgets/IconButtonWidget.dart';
import 'ChatMessage.dart';

class FriendlyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Friendly Chat'),
      ),
      body: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  Future<Null> _handleSubmitted(String text) async {
    if (text.length == 0) {
      return;
    }
    await AuthFirebase.auth();
    _textController.clear();
    _sendMessage(text: text);
  }

  void _sendMessage({String text, String image}) {
    DBFirebase.getRef('messages').push().set({
      'text': text,
      'name': AuthFirebase.getUser().displayName,
      'avatar': AuthFirebase.getUser().photoUrl,
      'image': image,
    });

    Analytics.getInstance().logEvent(name: 'send_message');
  }

  Future<Null> _sendPhoto() async {
    await AuthFirebase.auth();
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    int random = new Random().nextInt(100000);
    StorageReference ref = StorageFirebase.getRef("image_$random");
    var task = ref.putFile(image);
    Uri url = (await task.future).downloadUrl;
    _sendMessage(image: url.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new FirebaseAnimatedList(
            reverse: true,
            padding: new EdgeInsets.all(8.0),
            query: DBFirebase.getRef('messages'),
            sort: (a, b) => b.key.compareTo(a.key),
            itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
                    int index) =>
                new ChatMessage(snapshot: snapshot, animation: animation),
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new IconButton(
                  icon: new Icon(Icons.photo_camera),
                  onPressed: _sendPhoto,
                ),
              ),
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration(
                    hintText: "Write Message",
                    border: InputBorder.none,
                    fillColor: Colors.red,
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButtonWidget(
                  child: new Icon(Icons.send),
                  iosChild: new Icon(Icons.plus_one),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ),
            ],
          ),
          decoration: defaultTargetPlatform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(
                    top: new BorderSide(color: MyTheme.grey),
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
