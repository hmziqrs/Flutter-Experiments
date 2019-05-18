import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _ins = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<FirebaseUser> signInWithGoogle({idToken, accessToken}) async {
    // final googleUser =
    //     await _ins.signInWithGoogle(idToken: idToken, accessToken: accessToken);
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: accessToken,
      idToken: idToken,
    );

    final googleUser = await _ins.signInWithCredential(credential);
    this._user = googleUser;
    return googleUser;
  }

  FirebaseUser get user => this._user;

  Future signOut() async {
    await _ins.signOut();
    this._user = null;
    return null;
  }

  Future<FirebaseUser> currentUser() async {
    final firebaseUser = await _ins.currentUser();
    this._user = firebaseUser;
    return firebaseUser;
  }
}

final auth = new Auth();
