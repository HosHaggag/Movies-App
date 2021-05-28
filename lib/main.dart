import 'package:flutter/material.dart';
import 'package:instabug_moviesapp/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies List',
        home: Pagedate());
  }
}
