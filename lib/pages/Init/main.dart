import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experimint/services/firebase/main.dart';

class InitApp extends StatefulWidget {
  InitApp(this.parentContext);
  final BuildContext parentContext;
  @override
  _InitAppState createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  bool _loading = true;
  FirebaseUser _user;
  GoogleSignIn googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final _fireStore = Firestore.instance.collection('users');

  @override
  void initState() {
    this.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // @override
  // didChangeDependencies() {
  //   this.init();
  //   super.didChangeDependencies();
  // }

  @override
  void didUpdateWidget(InitApp oldWidget) {
    print("DID UPDATE");
    if (this._user != null) {
      print("CHECK CLEAR");
      // Navigator.of(widget.parentContext).pushReplacementNamed('/home');
    }
    super.didUpdateWidget(oldWidget);
  }

  Future googleLogin() async {
    print('GOOGLE LOGIN ****');
    try {
      final googleUser =
          (await googleSignIn.signInSilently(suppressErrors: false)) ??
              (await googleSignIn.signIn());
      // final googleUser = (await googleSignIn.signInSilently()) ??
      //     (await googleSignIn.signIn());
      final authentication = await googleUser.authentication;
      final user = await auth.signInWithGoogle(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      await googleSignIn.signOut();
      final query = await _fireStore.document(user.uid).get();
      print('*****************');
      print(query.toString());
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      print("%%%%%%%%%%%%%%%");
      print(e.toString());
    }
  }

  Future init() async {
    final user = await auth.currentUser();
    print('&&&&&');
    print(user);
    if (user != null) {
      setState(() {
        this._loading = false;
        this._user = user;
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  void logout() {
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _loading
                  ? new Text("HELLOW WORLD LOAIDNG")
                  : new Text("HELLOW WORLD"),
              new RaisedButton(
                child: new Text("GOOGLE SIGNIN"),
                onPressed: this.googleLogin,
              ),
              new RaisedButton(
                child: new Text("Log out"),
                onPressed: this.logout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
