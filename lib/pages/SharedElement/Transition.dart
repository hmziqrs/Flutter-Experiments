import 'dart:async';
import 'package:flutter/material.dart';
import './TabBar.dart' as Tab;

class SharedElementTransition extends StatefulWidget {
  SharedElementTransition(this.routeObserver);
  final RouteObserver<PageRoute> routeObserver;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SharedElementTransitionState();
  }
}

class SharedElementTransitionState extends State<SharedElementTransition>
    with RouteAware {
  bool isVisible = false;
  bool canGo = false;
  bool backPressed = false;
  var subscription;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(this);
    super.dispose();
  }

  void didPush() {
    // debugPrint("didPush ${runtimeType}");
    var future = new Future.delayed(const Duration(milliseconds: 330));
    subscription = future.asStream().listen(
          (e) => setState(() {
                isVisible = true;
              }),
        );

    setState(() {
      // isVisible = true;
    });
  }

  // Called when the current route has been popped off.
  void didPop() {
    // debugPrint("didPop ${runtimeType}");
    subscription.cancel();
  }

  setCanGo(bool flag) {
    setState(() {
      canGo = flag;
    });
  }

  backPressedCallback() {
    setState(() {
      backPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Hero(
                tag: "app-bar",
                child: new Container(
                  height: 120.0,
                  color: Colors.blue,
                  padding: new EdgeInsets.only(top: statusBarHeight),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              new Hero(
                tag: "content",
                child: new Material(
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: height - 240.0,
                    color: Colors.red,
                    child: new Text("WOW THIS IS SOME SERIOS STUUFF"),
                  ),
                ),
              ),
              new Tab.TabBar(
                transition: true,
                height: 120.0,
                isVisible: isVisible,
                canGo: canGo,
                setCanGo: setCanGo,
                backPressed: backPressed,
                backPressedCallback: backPressedCallback,
                forceBlock: true,
              )
            ],
          ),
          new Positioned(
            top: 30.0,
            left: 15.0,
            child: new Hero(
              tag: "profile",
              child: new Image(
                height: 60.0,
                width: 60.0,
                image: new AssetImage("assets/planets/moon.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
