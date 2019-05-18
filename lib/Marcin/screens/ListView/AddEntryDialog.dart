import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:numberpicker/numberpicker.dart';
import './WeightListItem.dart' show WeightSave;

class AddEntryDialog extends StatefulWidget {
  AddEntryDialog({this.weightSave});
  final WeightSave weightSave;
  @override
  AddEntryDialogState createState() =>
      AddEntryDialogState(weightSave: weightSave);
}

class AddEntryDialogState extends State<AddEntryDialog> {
  TextEditingController _textEditingController;
  DateTime dateTime = new DateTime.now();
  double _weight = 0.0;
  String _note;

  AddEntryDialogState({weightSave}) {
    if (weightSave != null) {
      dateTime = weightSave.dateTime;
      _weight = weightSave.weight;
      _note = weightSave.note;
    }
  }

  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _note);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future showWeightPicker(BuildContext context) async {
    final data = await showDialog(
      context: context,
      builder: (_) => new NumberPickerDialog.decimal(
            minValue: 0,
            maxValue: 150,
            initialDoubleValue: _weight,
            title: new Text("Enter your weight"),
          ),
    );
    setState(() {
      _weight = data ?? 0.0;
    });
  }

  save() {
    final weight = new WeightSave(this.dateTime, this._weight, this._note);
    Navigator.of(context).pop(weight);
  }

  @override
  Widget build(BuildContext c) {
    return new MaterialApp(
      home: this.buildApp(),
      theme: Theme.of(context),
    );
  }

  Widget buildApp() {
    return new Scaffold(
      appBar: AppBar(
        title: Text('New Entry'),
        actions: <Widget>[
          new FlatButton(
            onPressed: this.save,
            child: new Text(
              "SAVE",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.today, color: Colors.grey[500]),
              title: new DateTimeItem(
                dateTime: dateTime,
                onChanged: (val) => setState(() => dateTime = val),
              ),
            ),
            new ListTile(
              leading: new Image.asset(
                "assets/marcin/scale-bathroom.png",
                color: Colors.grey[500],
                height: 24.0,
                width: 24.0,
              ),
              title: new Text(
                "$_weight kg",
              ),
              onTap: () => this.showWeightPicker(context),
            ),
            new ListTile(
              leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
              title: new TextField(
                decoration: new InputDecoration(hintText: "Add Note"),
                controller: _textEditingController,
                onChanged: (text) => _note = text,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeItem extends StatelessWidget {
  DateTimeItem({DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? new DateTime.now()
            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  Future toggleDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date.subtract(const Duration(days: 20000)),
      lastDate: new DateTime.now(),
    );

    if (dateTimePicked != null) {
      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future toggleTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
        await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(new DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: () => this.toggleDatePicker(context),
            child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text(new DateFormat('EEEE, MMMM d').format(date)),
            ),
          ),
        ),
        new InkWell(
          onTap: () => this.toggleTimePicker(context),
          child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text(
                "${time.hour.toString()}:${time.minute.toString()} ${time.period.toString().replaceAll("DayPeriod.", "")}"),
          ),
        )
      ],
    );
  }
}
