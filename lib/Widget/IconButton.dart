import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({this.onPressed, this.child});
  final onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new IconTheme(
      data: new IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? new CupertinoButton(
              child: child,
              onPressed: onPressed,
            )
          : new IconButton(
              icon: this.child,
              onPressed: this.onPressed,
            ),
    );
  }
}
