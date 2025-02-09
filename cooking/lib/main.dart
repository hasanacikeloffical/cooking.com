import 'package:flutter/material.dart';
import 'package:cooking/pages/homepage.dart';
import 'package:cooking/leafs/leaf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cooking.com",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: HomePage(),
    );
    
  }
}
