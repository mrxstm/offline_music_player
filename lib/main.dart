import 'package:flutter/material.dart';
import 'package:musicccc/Provider/song_provider.dart';
import 'package:musicccc/Screen/Home.dart';
import 'package:musicccc/screen/mini_player.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SongProvider(),
        child : MaterialApp(
          title: 'Music App',
          theme: ThemeData(
              fontFamily: "Manrope"
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
    );
  }
}