import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO-DO App',
      theme: new ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(20, 108, 148, 1)),
      home: Home(),
    );
  }
}
