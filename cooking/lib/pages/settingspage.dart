import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: Text(
          'Ayarlar Sayfası',
          style: TextStyle(
            fontSize: 24,
            color: Colors.amber.shade800,
          ),
        ),
      ),
    );
  }
}
