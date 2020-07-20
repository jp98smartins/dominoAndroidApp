import 'package:domino_app/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dominózão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FredokaOne',
        primaryColor: Colors.cyan[900],
        accentColor: Colors.cyan[900],
        primarySwatch: Colors.cyan,
        cursorColor: Colors.cyan[900],
      ),
      home: Home(),
    );
  }
}