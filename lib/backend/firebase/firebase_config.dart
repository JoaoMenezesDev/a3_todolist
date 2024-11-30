import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDfSDgVIagohqeNiOskyMEaTCuGlmzVuQA",
            authDomain: "to-do-app-ccf79.firebaseapp.com",
            projectId: "to-do-app-ccf79",
            storageBucket: "to-do-app-ccf79.firebasestorage.app",
            messagingSenderId: "47517895655",
            appId: "1:47517895655:web:ff8c68a33018ff2daccb42"));
  } else {
    await Firebase.initializeApp();
  }
}
