import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String username;
  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih sesuai Figure 2
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Teks: Welcome, [username]!
              Text(
                "Welcome, ${widget.username}!",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              Expanded(
                child: ListView.builder(
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    final movie = movieList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Border tipis sesuai Figure 2
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MovieDetailPage(movie: movie)
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Kotak Abu-abu untuk Gambar
                              Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey[300], // Warna placeholder abu-abu
                                child: Image.network(movie.imgUrl, fit: BoxFit.cover),
                              ),
                              const SizedBox(width: 12),
                              
                              // Detail Teks
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${movie.title} (${movie.year})",
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text(
                                      movie.genre,
                                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.orange, size: 18),
                                        const SizedBox(width: 4),
                                        Text("Rating ${movie.rating}/10", style: const TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Ikon Bookmark di Pojok Atas
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  movie.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                  color: movie.isBookmarked ? Colors.blue : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    movie.isBookmarked = !movie.isBookmarked;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}