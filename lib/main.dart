import 'package:flutter/material.dart';
import 'package:arumosum/components/bottomnavbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'arumosum.lk',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Raleway"),
      home: BottomNavBar(),
    );
  }
}
