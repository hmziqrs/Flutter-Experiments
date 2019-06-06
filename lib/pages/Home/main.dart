import 'package:flutter/material.dart';
import 'package:experimint/Widgets/GradientButton.dart';
import 'package:experimint/services/firebase/main.dart';

class HomeScreen extends StatelessWidget {
  final list = [
    {'route': '/friendlyChat', 'name': 'Friendly Chat'},
    {'route': '/shoesConcept', 'name': 'Shoes Concept'},
    {'route': '/shoesConceptOptimize', 'name': 'Shoes Concept Optimize'},
    {'route': '/animationDemo', 'name': 'Animation Concept'},
    {'route': '/planetsHome', 'name': 'Flutter Planets Concept'},
    {'route': '/wordGenerator', 'name': 'Word Generator'},
    {'route': '/sharedElementHome', 'name': 'SharedElement'},
    {'route': '/marcinHome', 'name': 'Marcin Home'},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Expermints'),
      ),
      body: new SizedBox.expand(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...list
                .map(
                  (obj) => new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new GradientButton(
                          child: new Text(obj['name']),
                          onPress: () =>
                              Navigator.of(context).pushNamed(obj['route']),
                        ),
                      ),
                )
                .toList(),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new GradientButton(
                child: new Text("Logout"),
                onPress: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacementNamed('/init');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
