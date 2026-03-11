import 'package:flutter/material.dart';
import 'moviel_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userC = TextEditingController();
  final passC = TextEditingController();

  void _login() {
    // Validasi login tidak boleh kosong dan password sesuai NIM
    if (userC.text.isNotEmpty && passC.text == '043') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login berhasil'), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MovieListPage(username: userC.text)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login gagal'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul "Login" Besar
            const Text(
              "Login",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Sub-judul kecil
            const Text(
              "Welcome back to MiniLens!",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 40),

            // TextField Username dengan border kotak
            TextField(
              controller: userC,
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),

            // TextField Password kotak
            TextField(
              controller: passC,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Login Abu-abu Minimalis
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Warna abu-abu sesuai gambar
                  foregroundColor: Colors.black54,
                  elevation: 0, // Tanpa bayangan agar flat
                  shape: const RoundedRectangleBorder(), // Kotak tanpa lengkungan
                ),
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}