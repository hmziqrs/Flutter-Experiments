import 'package:firebase_database/firebase_database.dart';

class Database {
  final _ins = FirebaseDatabase.instance;

  Database() {
    _ins.setPersistenceEnabled(true);
  }

  DatabaseReference reference() => _ins.reference();

  DatabaseReference marcinWeightTracker() =>
      _ins.reference().child('marcin-weight-tracker');
}

final database = new Database();
