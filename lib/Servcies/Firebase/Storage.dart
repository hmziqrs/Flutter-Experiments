import 'package:firebase_storage/firebase_storage.dart';

class StorageFirebase {
  static final FirebaseStorage _instance = FirebaseStorage.instance;

  static FirebaseStorage getInstance() => _instance;

  static StorageReference getRef(ref) => _instance.ref().child(ref);
}
