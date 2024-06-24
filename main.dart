import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilink/admin/admin_login.dart';
import 'package:ilink/pages/bottomnav.dart';
import 'package:ilink/pages/home.dart';
import 'package:ilink/pages/posting.dart';
import 'package:ilink/pages/signup.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        ),
        home: SignUp()
    );
  }
}
