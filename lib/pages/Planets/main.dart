import 'package:flutter/material.dart';

import './GradientAppBar.dart';
import './Wrapper.dart';
import './PlanetSummary.dart';
import './data.dart';

class PlanetHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Wrapper(
      new Column(
        children: [
          new GradientAppBar("Hoola"),
          new Expanded(
            child: new Container(
              color: new Color(0xFF736AB7),
              child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  new SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    sliver: new SliverFixedExtentList(
                      itemExtent: 160.0,
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) => new PlanetSummary(planets[index]),
                        childCount: planets.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// new ListView.builder(
//                 itemCount: planets.length,
//                 padding: new EdgeInsets.symmetric(vertical: 16.0),
//                 itemBuilder: (c, index) => new PlanetSummary(planets[index]),
//               ),
