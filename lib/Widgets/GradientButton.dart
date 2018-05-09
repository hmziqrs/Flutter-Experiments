import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({this.child, this.onPress});
  final Widget child;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
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
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5.0,
            offset: const Offset(
              0.0,
              2.0,
            ),
          ),
        ],
      ),
      child: new Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          const Radius.circular(4.0),
        ),
        child: new InkWell(
          splashColor: Colors.black.withOpacity(0.2),
          child: new Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: child,
          ),
          onTap: onPress,
          // Navigator.of(context).pushNamed('/friendlyChat'),
        ),
      ),
    );
  }
}
