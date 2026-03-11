/// ===== MODUL IV - NAVIGATION =====
/// Profile Page menampilkan profil user
/// Mendemonstrasikan:
/// - Modul IV: Menerima parameter dari halaman sebelumnya (username)
/// - Modul IV: Navigasi dengan pushReplacement untuk logout
/// ==========================================

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  /// Parameter username yang diterima dari NewsListPage
  /// Username diambil dari output login untuk personalisasi
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  /// Build method untuk menampilkan profil user
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // MODUL IV - Back button untuk kembali ke halaman sebelumnya
        // Menggunakan Navigator.pop() untuk kembali ke NewsListPage
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            // Menampilkan greeting dengan username dari parameter
            child: Text(
              "Selamat datang, $username!",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
