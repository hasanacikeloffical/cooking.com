import 'package:flutter/material.dart';
import 'package:cooking/main.dart';
import 'package:cooking/pages/CategoryPage.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  List<String> categories = []; // List to store category names

  // Yeni kategori ekleme fonksiyonu
  void _addCategory() {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Yeni Kategori Ekle"),
          content: TextField(
            controller: categoryController,
            decoration: InputDecoration(hintText: "Kategori adını girin"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                if (categoryController.text.isNotEmpty) {
                  setState(() {
                    categories.add(
                        categoryController.text); // Add new category to list
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Ekle"),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
  }

  // Navigate to CategoryPage when a category is tapped
  void _navigateToCategoryPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(title: category)),
    );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _addCategory,
              child: Text("Yeni Kategori Ekle"),
            ),
            SizedBox(height: 16), // Add some space between button and list
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _navigateToCategoryPage(
                        categories[index]), // Navigate on tap
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          categories[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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

class CategoryPage {}

// Ayarlar sayfası
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ayarlar",
          style: TextStyle(color: Colors.amber.shade800),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Text(
          "Ayarlar Sayfası",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
