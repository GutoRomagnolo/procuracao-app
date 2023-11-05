import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 76, 212, 103),
      ),
      home: const Scaffold(
        body: ViewLogin(),
      ),
    );
  }
}
