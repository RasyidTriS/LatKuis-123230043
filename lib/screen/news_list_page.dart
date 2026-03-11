/// ===== MODUL III - STATE & DATA =====
/// ===== MODUL IV - NAVIGATION =====
/// News List Page menampilkan list dari data News
/// Menggunakan ListView.builder untuk menampilkan data dari List<NewsModel>
/// Mendemonstrasikan:
/// - Modul III: Mengakses data dari model melalui newsList dan property-nya
/// - Modul IV: Navigasi ke DetailPage dan ProfilePage menggunakan Navigator.push()
/// ==========================================

import 'package:flutter/material.dart';
import '../models/news_model.dart'; // GANTI: Import model sesuai soal
import 'detail_page.dart';
import 'profile_page.dart';
import 'login_page.dart';

class NewsListPage extends StatelessWidget {
  /// Variabel username yang diterima dari LoginPage
  /// Ditampilkan di ProfilePage ketika user membuka halaman profile
  final String username;

  const NewsListPage({super.key, required this.username});

  @override
  /// Method build untuk membuat UI dari NewsListPage
  /// Menampilkan AppBar dengan tombol profile dan logout
  /// Menampilkan ListView berisi news cards dari data model
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== MODUL IV - NAVIGATION =====
      // AppBar dengan aksi navigasi ke ProfilePage dan LoginPage
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "News App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          // MODUL IV: Button navigasi ke ProfilePage dengan push
          // push() menyimpan state sehingga bisa kembali menggunakan back button
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username),
                ),
              );
            },
          ),
          // MODUL IV: Button logout navigasi ke LoginPage dengan pushReplacement
          // pushReplacement() mengganti halaman tanpa menyimpan history
          // Sehingga user tidak bisa kembali ke NewsListPage
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      // ===== MODUL III - STATE & DATA =====
      // Body menampilkan ListView dari data model
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        // GANTI: Ambil length dari list di model
        // itemCount mengambil jumlah data dari List<NewsModel> newsList
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // MODUL IV: Navigasi ke DetailPage saat card di-tap
            // Mengirimkan object NewsModel ke halaman detail
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // GANTI: Pass object model ke halaman detail
                  // newsList[index] berisi object NewsModel lengkap
                  builder: (context) => DetailPage(news: newsList[index]),
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    // GANTI: Property image dari model
                    // Menampilkan gambar dari URL yang tersimpan di model
                    child: Image.network(
                      newsList[index].image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GANTI: Property title dari model
                        Text(
                          newsList[index].title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            // GANTI: Property likes dari model
                            Text(
                              "${newsList[index].likes} likes",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
