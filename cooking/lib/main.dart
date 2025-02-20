import 'package:flutter/material.dart';
import 'package:cooking/pages/homepage.dart';
import 'package:cooking/pages/CategoryPage.dart';
import 'package:cooking/main.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cooking",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: HomePage(),
      // Sınıf ismi büyük harfle başlamalı
    );
  }
}
