import 'dart:async';

import 'package:flutter/material.dart';

import 'package:experimint/services/firebase/main.dart';

import './WeightListItem.dart';
import './AddEntryDialog.dart';

void main() => runApp(MaterialApp(
      home: MarcinListView(),
    ));

class MarcinListView extends StatefulWidget {
  @override
  MarcinListViewState createState() => MarcinListViewState();
}

class MarcinListViewState extends State<MarcinListView> {
  final List<WeightSave> list = new List();
  final ScrollController listController = new ScrollController();

  MarcinListViewState() {
    database
        .reference()
        .child(auth.user.uid)
        .onChildAdded
        .listen(this.onChildAdded);
  }

  onChildAdded(e) {
    print(e);
  }

  Future add() async {
    final save = await this.openDialog();
    print(save);
    if (save != null) {
      await database.reference().child(auth.user.uid).set(save.toJson());
    }
  }

  Future edit(WeightSave weightSave) async {
    print("****");
    print(weightSave.toJson());
    final save = await this.openDialog(weightSave: weightSave);
    print(save);
    return;
    setState(() {
      if (save != null) {
        list.add(save);
      }
      // list.add(new WeightSave(
      //     new DateTime.now(), new Random().nextInt(100).toDouble()));
    });
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
        reverse: true,
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
