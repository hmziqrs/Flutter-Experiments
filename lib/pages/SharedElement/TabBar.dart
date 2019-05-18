import 'dart:async';
import 'package:flutter/material.dart';

// class TabBar extends StatefulWidget {
//   TabBar({this.transition, this.height, this.isVisible});
//   final bool transition;
//   final bool isVisible;
//   final double height;

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return new TabBarState(
//         transition: transition, isVisible: isVisible, height: height);
//   }
// }

// class TabBarState extends State<TabBar> with WidgetsBindingObserver {
class TabBar extends StatelessWidget {
  TabBar({
    this.transition,
    this.height,
    this.isVisible,
    this.canGo,
    this.setCanGo,
    this.backPressedCallback,
    this.forceBlock = false,
    this.backPressed = false,
  });
  // TabBarState({this.transition, this.height, this.isVisible});
  final bool transition;
  final bool isVisible;
  final bool canGo;
  final bool forceBlock;
  final bool backPressed;
  final VoidCallback backPressedCallback;
  final Function(bool) setCanGo;
  final double height;
  final list = [1, 2, 3, 4];
  final List<int> visibled = [];

  Future<bool> willPop() async {
    this.backPressedCallback();
    return (canGo && forceBlock == false);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: this.willPop,
      child: new Hero(
        tag: "tab-bar",
        child: new Container(
          height: this.height,
          color: Colors.purple,
          child: this.isVisible
              ? Row(
                  children: list
                      .map((int index) => new Expanded(
                            child: new TabBarItem(
                              index,
                              this.setCanGo,
                              canGo,
                              this.backPressed,
                            ),
                          ))
                      .toList())
              : null,
        ),
      ),
    );
  }
}

class TabBarItem extends StatefulWidget {
  final int index;
  final bool canGo;
  final bool backPressed;
  final Function(bool) callback;
  TabBarItem(this.index, this.callback, this.canGo, this.backPressed);
  @override
  TabBarItemState createState() => TabBarItemState();
}

class TabBarItemState extends State<TabBarItem> {
  var isVisible = false;
  var subscription;
  var subscriptionx;

  @override
  void didUpdateWidget(TabBarItem oldWidget) {
    // print("WIDGET DID UPDATE");
    // print(widget.canGo);
    final index = 4 - widget.index;
    if (widget.canGo && widget.backPressed) {
      var future =
          new Future.delayed(new Duration(milliseconds: 200 * (index)));
      subscription = future.asStream().listen(
            (e) => setState(() {
                  isVisible = false;
                  if (index == 0) {
                    subscriptionx =
                        new Future.delayed(new Duration(milliseconds: 800))
                            .asStream()
                            .listen((_) => Navigator.of(context).pop());
                  }
                }),
          );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    var future =
        new Future.delayed(new Duration(milliseconds: 200 * widget.index));
    subscription = future.asStream().listen(
          (e) => setState(() {
                isVisible = true;
                if (widget.index == 3) {
                  subscriptionx =
                      new Future.delayed(new Duration(milliseconds: 800))
                          .asStream()
                          .listen((_) => widget.callback(true));
                }
              }),
        );
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    if (subscriptionx != null) {
      subscriptionx.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedOpacity(
      opacity: this.isVisible ? 1.0 : 0.0,
      child: new Container(
        height: 80.0,
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue,
      ),
      duration: new Duration(milliseconds: 800),
    );
  }
}
