import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class Wrapper extends StatelessWidget {
  Wrapper(this.content);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DefaultTextStyle(
        style: new TextStyle(
          fontFamily: 'Poppins',
          // color: Pigment.fromString('#000000'),
        ),
        child: content,
      ),
    );
  }
}
