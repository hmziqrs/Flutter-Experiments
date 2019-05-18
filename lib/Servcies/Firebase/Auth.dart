import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:experimint/Servcies/Google/Auth.dart';

class AuthFirebase {
  static final _instance = FirebaseAuth.instance;
  static GoogleSignInAccount _user;

  static Future<Null> auth() async {
    _user = await AuthGoogle.authGoogle();
    final credentials = await _user.authentication;
    // await _instance.signInWithGoogle(
    //     idToken: credentials.idToken, accessToken: credentials.accessToken);

    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
      accessToken: credentials.accessToken,
      idToken: credentials.idToken,
    );

    await _instance.signInWithCredential(authCredential);
  }

  static GoogleSignInAccount getUser() => _user;
}
