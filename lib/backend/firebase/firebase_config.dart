import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBH_x0NH0-flPHf78QN-vJ_uPlAkfplpIU",
            authDomain: "to-do-list-7pmcjg.firebaseapp.com",
            projectId: "to-do-list-7pmcjg",
            storageBucket: "to-do-list-7pmcjg.appspot.com",
            messagingSenderId: "577832177808",
            appId: "1:577832177808:web:ef90ea15e1796462f2c815"));
  } else {
    await Firebase.initializeApp();
  }
}
