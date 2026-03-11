/// ===== NEWS APP PROJECT =====
/// Aplikasi berita yang mendemonstrasikan konsep dari:
/// - Modul III: State & Data Management
///   * Menggunakan Model class (NewsModel) untuk struktur data
///   * StatefulWidget untuk state management (like functionality)
///   * Local state dengan setState()
///
/// - Modul IV: Navigation
///   * Navigation flow: LoginPage -> NewsListPage -> DetailPage/ProfilePage
///   * Menggunakan Navigator API (push, pushReplacement)
///   * Parameter passing antar halaman
///
/// Struktur Folder:
/// - lib/main.dart (entry point)
/// - lib/screen/ (halaman-halaman aplikasi)
/// - lib/models/ (data models)
/// ===============================

import 'package:flutter/material.dart';
import 'screen/login_page.dart'; // GANTI: Sesuai dengan struktur soal kuis

void main() {
  runApp(const MyApp());
}

/// Root widget aplikasi
/// Konfigurasi theme dan halaman awal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan debug banner
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue),
      // MODUL IV - Halaman awal aplikasi adalah LoginPage
      // Semua navigasi dimulai dari sini
      home: const LoginPage(),
    );
  }
}
