import 'package:flutter/material.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_password.dart';
import 'package:procuracaoapp/views/view_register.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 76, 212, 103)
      ),
      home: const ViewUser(),
    );
  }
}
