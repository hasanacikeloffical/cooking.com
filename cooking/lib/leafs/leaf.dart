import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradyanın renkleri
              begin: Alignment.topLeft,  // Gradyan başlangıç noktası
              end: Alignment.bottomRight, // Gradyan bitiş noktası
            ),
          ),
          child: Center(
            child: Text(
              'Gradient Background',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}