import 'package:firebase_database/firebase_database.dart';

class Database {
  final _ins = FirebaseDatabase.instance;

  Database() {
    _ins.setPersistenceEnabled(true);
  }

  DatabaseReference reference() => _ins.reference();
}

final database = new Database();
