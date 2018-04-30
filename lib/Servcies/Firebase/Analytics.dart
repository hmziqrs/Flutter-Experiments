import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static final FirebaseAnalytics _instance = new FirebaseAnalytics();

  static FirebaseAnalytics getInstance() => _instance;
}
