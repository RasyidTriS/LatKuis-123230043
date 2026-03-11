import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Movie Details", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // GUNAKAN SingleChildScrollView UNTUK MEMBUNGKUS SELURUH COLUMN
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GAMBAR FULL WIDTH TANPA CONTAINER PENGIKAT TINGGI
            Image.network(
              movie.imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth, // Memastikan gambar full kanan-kiri
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie.title} (${movie.year})",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Directed by ${movie.director}",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.synopsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Text("Genre: ${movie.genre}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Casts: ${movie.casts.join(', ')}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  
                  // Rating Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Rated ${movie.rating}/10",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  
                  // Tombol Wikipedia Abu-abu Sesuai Figure 3
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black54,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text("Go to Wikipedia"),
                    ),
                  ),
                  // RUANG EKSTRA DI BAWAH AGAR SCROLL TIDAK TERHENTI DI TOMBOL
                  const SizedBox(height: 40), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}