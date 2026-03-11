/// ===== MODUL III - STATE & DATA =====
/// Detail Page menampilkan detail lengkap dari sebuah news
/// Menggunakan StatefulWidget untuk mengelola state like/unlike
/// Mendemonstrasikan:
/// - Modul III: StatefulWidget lifecycle (initState, setState)
/// - Modul III: Menerima dan mengakses object NewsModel
/// - Modul III: State management dengan variable local (isLiked, likeCount)
/// ==========================================

import 'package:flutter/material.dart';
import '../models/news_model.dart'; // GANTI: Import model sesuai soal

class DetailPage extends StatefulWidget {
  /// GANTI: Terima object dari model
  /// newsModel object yang dikirimkan dari NewsListPage
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

/// MODUL III - State class untuk DetailPage
/// Mengelola state dari like/unlike functionality
class _DetailPageState extends State<DetailPage> {
  /// GANTI: Variable untuk tracking status like
  /// Menyimpan apakah user sudah menyukai berita ini
  late bool isLiked;

  /// GANTI: Variable untuk counting jumlah likes
  /// Menyimpan jumlah likes dari model dan update sesuai user action
  late int likeCount;

  @override
  /// MODUL III - initState lifecycle
  /// Method dijalankan sekali ketika State pertama kali dibuat
  /// Digunakan untuk inisialisasi variable state dari data model
  void initState() {
    super.initState();
    isLiked = false;
    // GANTI: Ambil property likes dari model
    // widget.news.likes mengakses property likes dari NewsModel yang diterima
    likeCount = widget.news.likes;
  }

  @override
  /// MODUL III - Build method
  /// Membuat UI dari detail page dengan data dari NewsModel
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // Pop navigasi untuk kembali ke halaman sebelumnya
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "News Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan gambar dari property model
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              // GANTI: Property image dari model
              // widget.news.image mengakses property image dari NewsModel
              child: Image.network(
                widget.news.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 250,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GANTI: Property title dari model
                  Text(
                    widget.news.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // GANTI: Property description dari model
                  Text(
                    widget.news.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  // ===== MODUL III - Like button dengan setState =====
                  // GestureDetector untuk mendeteksi tap pada like button
                  // setState() digunakan untuk update state dan rebuild widget
                  GestureDetector(
                    onTap: () {
                      // MODUL III - setState() untuk update state dan rebuild UI
                      setState(() {
                        // Toggle status like
                        isLiked = !isLiked;
                        // Increment atau decrement like count sesuai status
                        if (isLiked) {
                          likeCount++;
                        } else {
                          likeCount--;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        // Icon berubah warna berdasarkan status isLiked
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        // GANTI: Property dari model yang di-update dengan setState
                        Text(
                          "$likeCount likes",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
