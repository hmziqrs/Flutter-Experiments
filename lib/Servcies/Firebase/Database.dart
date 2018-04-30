import 'package:firebase_database/firebase_database.dart';

class DBFirebase {
  static final FirebaseDatabase _instance = FirebaseDatabase.instance;

  static FirebaseDatabase getInstance() => _instance;

  static DatabaseReference getRef(ref) => _instance.reference().child(ref);
}
