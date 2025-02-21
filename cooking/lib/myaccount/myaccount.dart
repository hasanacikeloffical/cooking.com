import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Boş Sayfa', style: TextStyle(fontSize: 20)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Butona basınca HomePage'e git
            // Navigator.push yerine pop kullanırsan geri gidemezsin
            // Eğer settingspage'e yönlendirmek istersen HomePage() yerine SettingsPage() yaz
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Buton rengi
          ),
          child: Text(
            'Ana Sayfaya Git',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
