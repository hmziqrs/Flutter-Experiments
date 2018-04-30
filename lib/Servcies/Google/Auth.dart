import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:experimint/Servcies/Firebase/Analytics.dart';

class AuthGoogle {
  static final GoogleSignIn _instance = new GoogleSignIn();

  static Future<GoogleSignInAccount> authGoogle() async {
    GoogleSignInAccount user = _instance.currentUser;
    if (user == null) {
      user = await _instance.signInSilently();
    }
    if (user == null) {
      user = await _instance.signIn();
    }
    if (user == null) {
      Analytics.getInstance().logLogin();
    }
    return user;
  }

  static GoogleSignIn getInstace() => _instance;
}
