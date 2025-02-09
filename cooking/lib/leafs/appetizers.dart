import 'package:flutter/material.dart';

class TomatoSoupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tomato Soup"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_dining, // Icon representing soup
              color: Colors.red.shade600,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Tomato Soup Recipe",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "A delicious and healthy tomato-based soup. Great for cold days!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red.shade400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
