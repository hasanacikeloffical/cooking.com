import 'package:flutter/material.dart';

class MainCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Course"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood, // Food-related icon
              color: Colors.green.shade600,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Main Course Recipes",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Here you can add the details of Main Course recipes!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green.shade400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
