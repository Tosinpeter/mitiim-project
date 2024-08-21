import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC9nemj2dQlHWKZg1gXRevpJ_3qK1JX-Ws",
            authDomain: "mitimapp-d36b0.firebaseapp.com",
            projectId: "mitimapp-d36b0",
            storageBucket: "mitimapp-d36b0.appspot.com",
            messagingSenderId: "858702192572",
            appId: "1:858702192572:web:8a422af0dc5f8e0128d5b9"));
  } else {
    await Firebase.initializeApp();
  }
}
