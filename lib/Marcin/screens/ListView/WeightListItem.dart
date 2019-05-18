import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:experimint/services/firebase/main.dart';
//     final user = auth.user;
//     await database.reference().child(user.uid).push().set(weight.toJson());

class WeightSave {
  WeightSave(this.dateTime, this.weight, this.note);

  DateTime dateTime;
  double weight;
  String note;

  toJson() =>
      {"weight": weight, "date": dateTime.millisecondsSinceEpoch, "note": note};
}

class WeightListItem extends StatelessWidget {
  final WeightSave weightSave;
  final double weightDifference;
  final Function(WeightSave) callback;

  WeightListItem(this.weightSave, this.weightDifference, this.callback);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => this.callback(weightSave),
      child: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    new DateFormat.yMMMMd().format(weightSave.dateTime),
                    textScaleFactor: 0.9,
                    textAlign: TextAlign.left,
                  ),
                  new Text(
                    new DateFormat.EEEE().format(weightSave.dateTime),
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            new Expanded(
              child: new Text(
                weightSave.weight.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
              ),
            ),
            new Expanded(
              child: new Text(
                weightDifference.toString(),
                textAlign: TextAlign.right,
                textScaleFactor: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
