import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAqZMaLOAcmVEEMEcNTWKnhEBAwXL_Hj7w",
            authDomain: "subtext-69ftp.firebaseapp.com",
            projectId: "subtext-69ftp",
            storageBucket: "subtext-69ftp.appspot.com",
            messagingSenderId: "167569458958",
            appId: "1:167569458958:web:72368d6b79721f3b8f395f",
            measurementId: "G-R64DQYDCTB"));
  } else {
    await Firebase.initializeApp();
  }
}
