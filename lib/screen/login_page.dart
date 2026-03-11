import 'package:flutter/material.dart';
import 'news_list_page.dart';

/// ===== MODUL III - STATE & DATA =====
/// Login Page adalah halaman pertama yang ditampilkan
/// Menggunakan StatefulWidget untuk mengelola state dari input user
/// ==========================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// GANTI: Controller untuk input username dari user
  /// Menyimpan state dari input field username
  final userC = TextEditingController();

  /// GANTI: Controller untuk input password dari user
  /// Menyimpan state dari input field password
  final passC = TextEditingController();

  /// Fungsi untuk validasi dan proses login
  /// Memvalidasi bahwa username tidak kosong dan password sesuai dengan nilai yang ditentukan
  void _login() {
    // GANTI: Ubah kondisi validasi sesuai dengan soal kuis
    if (userC.text.isNotEmpty && passC.text == '043') {
      // Tampilkan notifikasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil'),
          backgroundColor: Colors.green,
        ),
      );

      // MODUL IV - NAVIGATION: Navigasi ke halaman berikutnya
      // Menggunakan Navigator.pushReplacement untuk mengganti halaman current
      // dengan halaman baru tanpa menyimpan history sebelumnya
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NewsListPage(username: userC.text),
        ),
      );
    } else {
      // Tampilkan notifikasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Logo UPN Yogyakarta
              Image.network(
                'https://upload.wikimedia.org/wikipedia/id/thumb/0/0d/Logo_Universitas_Pembangunan_Nasional_Veteran_Yogyakarta.png/250px-Logo_Universitas_Pembangunan_Nasional_Veteran_Yogyakarta.png',
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              // Judul "Login"
              const Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Sub-judul
              const Text(
                "Login untuk mengaksess lebih banyak fitur",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 40),

              // TextField Username dengan icon
              TextField(
                controller: userC,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // TextField Password dengan icon
              TextField(
                controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Login Hijau dengan border radius
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
