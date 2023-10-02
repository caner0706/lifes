import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(), --> Uygulamayı Genel Olarak Dark Moda Almak İÇin Kullanılır.
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo[900],
      ),
      home: InputPage(),
    );
  }
}

