import 'package:flutter/material.dart';

// Recipe pages for each dish
class ChickenCurryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chicken Curry Recipe"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_dining, color: Colors.orange.shade600, size: 100),
            SizedBox(height: 20),
            Text(
              "A flavorful, spicy chicken curry dish with aromatic spices.",
              style: TextStyle(fontSize: 18, color: Colors.orange.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HotDishesPage extends StatelessWidget {
  final List<String> dishNames = [
    "Chicken Curry",
    "Grilled Chicken",
    // Add more hot dishes here
  ];

  final List<Widget> dishPages = [
    ChickenCurryPage(),
    // Add the pages for more dishes here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hot Dishes"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dishNames.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the corresponding dish recipe page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dishPages[index]),
                );
              },
              child: Card(
                color: Colors.amber.shade100,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                    dishNames[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown.shade600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HotDishesPage()));
}
