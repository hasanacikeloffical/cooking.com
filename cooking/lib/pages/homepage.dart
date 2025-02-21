import 'package:flutter/material.dart';
import 'package:cooking/pages/CategoryPage.dart'; // Doğru import edildi!
import 'package:cooking/bottom_nav_bar.dart';
import 'package:cooking/pages/settingspage.dart';


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
                    categories.add(categoryController.text);
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

  // Kategoriye tıklanınca CategoryPage'e git
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
      Expanded(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _navigateToCategoryPage(categories[index]),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    categories[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            );
          },
        ),
      ),
      SizedBox(height: 16), // Butonun listeden ayrılmasını sağlar
      Align(
        alignment: Alignment.bottomCenter, // Butonu ortalar
        child: ElevatedButton(
          onPressed: _addCategory,
          child: Text("Yeni Kategori Ekle"),
        ),
      ),
    ],
  ),
),

    
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });

          if (index == 1) {
            // Eğer "Ayarlar" seçildiyse
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            ).then((_) {
              setState(() {
                _selectIndex = 0;
              });
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }
}

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
