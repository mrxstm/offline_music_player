import 'package:flutter/material.dart';
import 'package:musicccc/Screen/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        fontFamily: "Manrope"
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}