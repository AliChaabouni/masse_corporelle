import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/login/login.dart';
import 'package:projetflutter/login/singup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDWitlYVIwFiNiDu4sdOEQVIUh0wJblRg4",
          authDomain: "userprofile-6f91a.firebaseapp.com",
          projectId: "userprofile-6f91a",
          storageBucket: "userprofile-6f91a.appspot.com",
          messagingSenderId: "630397001526",
          appId: "1:630397001526:web:cf70278431bab388111d97",
          measurementId: "G-JZSPDWF7GC"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
