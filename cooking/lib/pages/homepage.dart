import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> kutuIsimleri = [
    "Ana Yemekler",
    "Çorbalar",
    "Salatalar",
    "Mezeler",
    "Ara Sıcak",

    "Tatlılar",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Cooking.com',
       style: TextStyle(fontFamily: 'brittanic bold',
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
            return Container(
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
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Navigasyon işlemleri burada gerçekleştirilebilir
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
   

  }
}
