import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simdev/Screen/LoginScreen.dart';
import 'package:simdev/Screen/SignupScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
        home: LoginScreen(),
    );
  }
}

