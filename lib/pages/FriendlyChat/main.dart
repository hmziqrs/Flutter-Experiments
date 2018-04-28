import 'package:flutter/material.dart';
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
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  var _isComposing = false;

  void _handleSubmitted(String text) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            padding: new EdgeInsets.all(0.8),
            itemBuilder: (_, int index) => _messages[index],
          ),
        ),
        new Divider(height: 1.0),
        new Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String text) {
                      setState(() {
                        _isComposing = text.length > 0;
                      });
                    },
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration(
                      hintText: "Write Message",
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
