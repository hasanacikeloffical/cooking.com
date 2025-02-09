import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0; // Variable to keep track of selected index

  final List<String> kutuIsimleri = [
    "Ana Yemekler",
    "Çorbalar",
    "Salatalar",
    "Mezeler",
    "Ara Sıcak",
    "Tatlılar",
  ];

  // List of corresponding pages for each category
  final List<Widget> categoryPages = [
    CategoryPage(title: "Ana Yemekler"),
    CategoryPage(title: "Çorbalar"),
    CategoryPage(title: "Salatalar"),
    CategoryPage(title: "Mezeler"),
    CategoryPage(title: "Ara Sıcak"),
    CategoryPage(title: "Tatlılar"),
  ];

  // This method handles tapping on a BottomNavigationBar item
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    if (index == 1) {
      // If the "Settings" item is tapped, navigate to the SettingsPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cooking.com',
          style: TextStyle(
            fontFamily: 'brittanic bold',
            color: Colors.amber.shade800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(kutuIsimleri.length, (index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the corresponding category page when a grid item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categoryPages[index],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    kutuIsimleri[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.amber.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }
}

// Create a page that opens when a box is tapped
class CategoryPage extends StatelessWidget {
  final String title;

  CategoryPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.amber.shade800,
          ),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Container(
          color: Colors.white, // Set the background to white
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

// Settings page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ayarlar", // Settings title
          style: TextStyle(color: Colors.amber.shade800),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
