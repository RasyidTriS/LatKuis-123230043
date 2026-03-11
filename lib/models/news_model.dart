/// ===== MODUL III - STATE & DATA =====
/// Model untuk data News
/// Mendefinisikan struktur data yang akan digunakan dalam aplikasi
/// Setiap property merepresentasikan atribut dari sebuah berita
/// ==========================================

class NewsModel {
  /// GANTI: Judul berita - sesuai dengan soal kuis
  final String title;

  /// GANTI: URL gambar berita - sesuai dengan soal kuis
  final String image;

  /// GANTI: Deskripsi lengkap berita - sesuai dengan soal kuis
  final String description;

  /// GANTI: Jumlah likes/rating - sesuai dengan soal kuis
  final int likes;

  /// Constructor untuk membuat instance NewsModel
  /// Semua parameter bersifat required (wajib diisi)
  NewsModel({
    required this.title,
    required this.image,
    required this.description,
    required this.likes,
  });
}

/// ===== DATA DARI MODEL =====
/// List berisi data simulasi yang sesuai dengan contoh soal kuis
/// Mendemonstrasikan bagaimana menggunakan Model untuk struktur data
///
/// GANTI: Tambah atau ubah data sesuai dengan soal kuis
List<NewsModel> newsList = [
  // GANTI: Instansiasi NewsModel dengan property dari model
  NewsModel(
    title: "SpaceX Meluncurkan Roket Terbaru",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BtUzDYHYDVj12F_CuYxdz9VchNtb85D7uQ&s",
    description:
        "SpaceX berhasil meluncurkan roket terbarunya dengan misi membawa satelit komunikasi ke orbit bumi. Peluncuran ini menandai pencapaian baru dalam eksplorasi ruang angkasa.",
    likes: 150,
  ),
  // GANTI: Instansiasi NewsModel dengan property dari model
  NewsModel(
    title: "Penemuan Teknologi AI Terbaru",
    image:
        "https://bis-jkt.telkomuniversity.ac.id/wp-content/uploads/2024/12/002.webp",
    description:
        "Para ilmuwan baru saja menemukan algoritma AI baru yang mampu memproses data 100x lebih cepat dari sebelumnya. Penemuan ini diharapkan dapat membantu riset medis secara signifikan.",
    likes: 200,
  ),
  // GANTI: Instansiasi NewsModel dengan property dari model
  NewsModel(
    title: "Pemerintah Fokus Green Energy",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbNl1Vc46Xx_ieVJhGp6DXQ2auUlA_dLovVg&s",
    description:
        "Dalam upaya mengurangi emisi karbon, pemerintah meluncurkan program panel surya massal untuk perumahan di seluruh pelosok negeri.",
    likes: 95,
  ),
];
// ===== AKHIR DATA =====
