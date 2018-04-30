import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({this.onPressed, this.iosChild, this.child});
  final VoidCallback onPressed;
  final Widget iosChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new IconTheme(
      data: new IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? new CupertinoButton(
              child: this.iosChild == null ? this.child : this.iosChild,
              onPressed: onPressed,
            )
          : new IconButton(
              icon: this.child,
              onPressed: this.onPressed,
            ),
    );
  }
}
