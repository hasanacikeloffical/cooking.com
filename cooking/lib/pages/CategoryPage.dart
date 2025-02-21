import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String title;

  const CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.amber.shade800),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Text(
          "$title sayfası",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
