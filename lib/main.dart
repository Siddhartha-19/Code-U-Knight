import 'package:code_u_knight/Authentication/register.dart';
import 'package:code_u_knight/Screens/entryscreen.dart';
import 'package:code_u_knight/Screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:/google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:provider/provider.dart';
import 'package:code_u_knight/Services/authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: StreamProvider<User?>.value(
        initialData: null,
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Checkscreen(),
        ),
      ),
    );
  }
}

class Checkscreen extends StatelessWidget {
  const Checkscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebase_user = Provider.of<User?>(context);
    if (firebase_user == null) {
      return EntryScreen();
    } else {
      print(firebase_user.uid);
      return HomeScreen();
    }
  }
}
