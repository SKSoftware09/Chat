import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          subtitle1: TextStyle(color: Colors.black54),
        ),
      ),
      home: RegistrationScreen(),
    );
  }
}
