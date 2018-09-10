import 'package:flutter/material.dart';
// import 'package:pigment/pigment.dart';

class GradientAppBar extends StatelessWidget {
  GradientAppBar(this.title);

  final String title;
  final double barHeight = 68.0;

  @override
  Widget build(BuildContext context) {
    final statusBarheight = MediaQuery.of(context).padding.top;
    return new Container(
      height: this.barHeight + statusBarheight,
      padding: new EdgeInsets.only(
        top: statusBarheight,
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
        ),
      ),
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
