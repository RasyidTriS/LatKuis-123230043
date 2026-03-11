import 'package:flutter/material.dart';
import 'screen/login_page.dart'; // Pastikan import ini benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan 'debug' di pojok
      title: 'Kuis Film',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Panggil halaman login kamu di sini
    );
  }
}