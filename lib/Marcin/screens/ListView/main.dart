import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:experimint/services/firebase/main.dart';

import './WeightListItem.dart';
import './AddEntryDialog.dart';

class WeightTracker extends StatefulWidget {
  @override
  WeightTrackerState createState() => WeightTrackerState();
}

class WeightTrackerState extends State<WeightTracker> {
  final List<WeightSave> list = new List();
  final ScrollController listController = new ScrollController();
  final dbRef = database.marcinWeightTracker().child(auth.user.uid);

  WeightTrackerState() {
    // dbRef.once(e)
    dbRef.onChildAdded.listen(this.onChildAdded);
    dbRef.onChildChanged.listen(this.onChildEdited);
  }

  onChildAdded(Event e) {
    list.add(new WeightSave.fromSnaphost(e.snapshot));
  }

  onChildEdited(Event e) {
    final old = list.singleWhere((obj) => obj.key == e.snapshot.key);
    setState(() {
      list[list.indexOf(old)] = new WeightSave.fromSnaphost(e.snapshot);
    });
  }

  Future add() async {
    try {
      final save = await this.openDialog();
      print('final save = await this.openDialog();');
      print(save.toJson());
      if (save != null) {
        await dbRef.push().set(save.toJson());
      }
    } catch (e) {
      print(e);
    }
  }

  Future edit(WeightSave weightSave) async {
    final save = await this.openDialog(weightSave: weightSave);
    dbRef.child(save.key).set(save.toJson());
  }

  Future<WeightSave> openDialog({WeightSave weightSave}) async {
    final save = await Navigator.of(context).push(
      new MaterialPageRoute<WeightSave>(
        builder: (_) => new AddEntryDialog(
              weightSave: weightSave,
            ),
        fullscreenDialog: true,
      ),
    );
    return save;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST VIEW'),
      ),
      body: new ListView.builder(
        // shrinkWrap: true,
        reverse: false,
        itemCount: list.length,
        controller: listController,
        itemBuilder: ((buildContext, index) {
          double diff =
              index == 0 ? 0.0 : list[index].weight - list[index - 1].weight;
          return new WeightListItem(
            list[index],
            diff,
            this.edit,
          );
        }),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: this.add,
        tooltip: 'Add New',
        child: new Icon(Icons.add),
      ),
    );
  }
}
